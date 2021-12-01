package com.hzx.controller;

import com.hzx.pojo.User;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RestController
public class AjaxController {
    @RequestMapping("/t1")
    public String test(){
        return "hello";
    }

    @RequestMapping(value = "/a1" , method = RequestMethod.POST)
    public void a1(String name, HttpServletResponse response) throws IOException {
        System.out.println("a1:param"+name);
        if("hzx".equals(name)){
            response.getWriter().println("true");
        }else{
            response.getWriter().println("false");
        }
    }

    @RequestMapping(value = "/a2",method = RequestMethod.POST)
    public List<User> a2(){
        List<User> userList = new ArrayList<User>();
        userList.add(new User("Java",1,"男"));
        userList.add(new User("前端",1,"女"));
        userList.add(new User("运维",1,"男"));

        return userList;
    }

    @RequestMapping("/a3")
    public String a3(String name,String pwd){
        String msg = "";
        if(name!=null){
            if("admin".equals(name)){
                msg = "ok";
            }else{
                msg = "用户名有误";
            }
        }
        if(pwd!=null){
            if("123456".equals(pwd)){
                msg = "ok";
            }else{
                msg = "密码有误";
            }
        }
        return msg;
    }
}

