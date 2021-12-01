package com.hzx.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hzx.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {

    @RequestMapping("/j1")
    @ResponseBody //它就不会走视图解析器 会直接返回一个字符串
    public String json1() throws JsonProcessingException {

        ObjectMapper objectMapper = new ObjectMapper();

        //创建一个对象
        User user = new User("hzx",3,"男");

        String s = objectMapper.writeValueAsString(user);
        return s;
    }
}
