package com.halfopen.ssm.controller.user;


import com.halfopen.ssm.bean.User;
import com.halfopen.ssm.controller.ResultBuilder;
import com.halfopen.ssm.service.RedisService;
import com.halfopen.ssm.service.UserService;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by h on 2017/8/7.
 */

@RequestMapping("/user")
@Controller
public class UserController{
    @Resource
    UserService userService;

    @Resource
    RedisService redisService;
    @RequestMapping(value = "/login", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public String login(HttpServletRequest request, @RequestParam String name,@RequestParam String password) throws IOException {
        System.out.println(name+" "+password);

        ResultBuilder rb = new ResultBuilder("1", "", "");

        System.out.println(userService);

        final HttpSession session = request.getSession();

        final User usobj = userService.getUser(name, password);
        ObjectMapper objectMapper = new ObjectMapper();

        System.out.println(usobj);
        if (usobj!=null){
            System.out.println(usobj);
            rb.setResult(ResultBuilder.SUCCESS);
            rb.setData(usobj.toString());
            //rb.setMessage("登录成功");
            session.setAttribute("username",usobj.getName());
            // 把用户信息存入redis中
            redisService.setValue(session.getId(), usobj.getName());
        }else{
            rb.setResult(ResultBuilder.FAIL);
            //rb.setMessage("用户不存在或密码错误");
        }

        String jsonString = objectMapper.writeValueAsString(rb);

        return jsonString;
    }

    @RequestMapping(value = "/logout", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public String logout(HttpServletRequest request, @RequestParam String name) throws IOException {

        ResultBuilder rb = new ResultBuilder("1", "success", "");
        System.out.println(userService);
        final HttpSession session = request.getSession();
        String username = redisService.getValue(session.getId());

        ObjectMapper objectMapper = new ObjectMapper();
        if (username!=null && username.equals(name)){

            session.removeAttribute("username");
        }else{
            rb.setResult("-1");
            //rb.setMessage("用户不存在或密码错误");
        }
        String jsonString = objectMapper.writeValueAsString(rb);
        return jsonString;
    }

}
