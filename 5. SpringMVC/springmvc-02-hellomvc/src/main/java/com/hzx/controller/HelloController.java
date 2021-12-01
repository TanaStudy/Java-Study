package com.hzx.controller;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//注意:这里先导入Controller接口
public class HelloController implements Controller {
    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //ModelAndView模型和视图
        ModelAndView mv = new ModelAndView();

        //封装对象,放在ModelAndView中 Model
        mv.addObject("msg","HelloSpringMVC!");
        //封装要跳转的视图,放在ModelAndView中
        mv.setViewName("hello"); // : /WEB-INF/jsp/hello.jsp
        return mv;
    }
}
