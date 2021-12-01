package com.hzx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller//代表这个类会被Spring接管
// 被这个注解的类中的所有方法 如果返回值是String 并且有具体页面可以跳转 那么就会被视图解析器解析
public class ControllerTest2 {

    @RequestMapping("/t2")
    public String test1(Model model){
        model.addAttribute("msg","ControllerTest2");
        return "test"; // WEB-INF/jsp/text.jsp
    }
}
