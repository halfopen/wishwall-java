package com.halfopen.ssm.controller.user;


import com.halfopen.ssm.bean.User;
import com.halfopen.ssm.controller.ResultBuilder;
import com.halfopen.ssm.service.UserService;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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

    @RequestMapping(value = "/login", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public String login(HttpServletRequest request, @RequestParam String name,@RequestParam String password) throws IOException {
        System.out.println(name+" "+password);

        ResultBuilder rb = new ResultBuilder("1", "", "");

        System.out.println(userService);

        HttpSession session = request.getSession();

        User usobj = userService.getUser(name, password);
        ObjectMapper objectMapper = new ObjectMapper();

        System.out.println(usobj);
        if (usobj!=null){
            System.out.println(usobj);
            rb.setResult(ResultBuilder.SUCCESS);
            rb.setData(usobj.toString());
            //rb.setMessage("登录成功");
            session.setAttribute("username",usobj.getName());
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
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
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
