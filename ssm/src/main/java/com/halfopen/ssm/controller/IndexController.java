package com.halfopen.ssm.controller;

import com.alibaba.fastjson.JSON;
import com.halfopen.ssm.bean.Message;
import com.halfopen.ssm.service.MessageService;
import com.halfopen.ssm.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class IndexController {
    @Resource
    MessageService messageService;

    @RequestMapping(value = "/")
    public String index(HttpServletRequest request, ModelMap model){
        System.out.println("index");
        model.addAttribute("user", "halfopen");
        return "index";
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login(){
        return "login";
    }

    @RequestMapping(value = "getMessages" , method = RequestMethod.GET)
    @ResponseBody
    public String getMessages(){
        return JSON.toJSONString(messageService.getMessages());
    }


    @RequestMapping(value = "addMessage" , method = RequestMethod.GET)
    @ResponseBody
    public String addMessage(HttpServletRequest request, @RequestParam String content){
        HttpSession session = request.getSession();
        Message message = new Message();
        if(null==session.getAttribute("username")) {
            message.setUsername("somebody");
        }
        else{
            message.setUsername((String)session.getAttribute("username"));
        }

        message.setContent(content);
        System.out.println(message);
        System.out.println(messageService.addMessage(message));
        return JSON.toJSONString(message);
    }

    @RequestMapping(value = "deleteMessage" , method = RequestMethod.GET)
    @ResponseBody
    public String addMessage(HttpServletRequest request, @RequestParam int id){
        if(null!=request.getSession().getAttribute("username"))return JSON.toJSONString(messageService.deleteMessage(id));
        return "please login first";
    }
}
