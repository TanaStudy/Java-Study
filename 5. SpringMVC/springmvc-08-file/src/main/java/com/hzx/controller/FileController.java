package com.hzx.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

@RestController
public class FileController {

    //@RequestParam("file") 将name=file控件得到的文件封装称CommonsMultipartFile对象
    //批量上传CommonsMultipartFile则为数组即可
    @RequestMapping("/upload")
    public String upload(@RequestParam("file")CommonsMultipartFile file, HttpServletRequest request) throws IOException {

        //获取文件名:file.getOriginalFilename();
        String uploadFileName = file.getOriginalFilename();

        //如果文件名为空 直接回到首页
        if("".equals(uploadFileName)){
            return "redirect:/index.jsp";
        }
        System.out.println("上传文件名:"+uploadFileName);

        //上传路径保存设置
        String path = request.getSession().getServletContext().getRealPath("/upload");
        //如果路径不存在 创建一个
        File realPath = new File(path);
        if(!realPath.exists()){
            realPath.mkdir();
        }
        System.out.println("上传文件保存地址:"+realPath);

        InputStream is = file.getInputStream();//文件输入流
        OutputStream os = new FileOutputStream(new File(realPath,uploadFileName));//文件输出流

        //读取写出
        int len = 0;
        byte[] buffer = new byte[1024];
        while((len = is.read(buffer)) != -1){
            os.write(buffer,0,len);
            os.flush();
        }
        os.close();
        is.close();
        return "redirect:/index.jsp";
    }

    /*
        采用filie.Transto来保存上传的文件
     */
    @RequestMapping("/upload2")
    public String fileUpload2(@RequestParam("file")CommonsMultipartFile file,HttpServletRequest request) throws IOException {

        //上传路径保存设置
        String path = request.getSession().getServletContext().getRealPath("/upload");
        //如果路径不存在 创建一个
        File realPath = new File(path);
        if(!realPath.exists()){
            realPath.mkdir();
        }
        System.out.println("上传文件保存地址:"+realPath);

        //通过ConmmonsMultipartFile的方法直接写文件
        file.transferTo(new File(realPath+"/"+file.getOriginalFilename()));

        return "redirect:/index.jsp";
    }

    /**
     * 文件下载
     */
    @RequestMapping("/download")
    public String downloads(HttpServletResponse response,HttpServletRequest request) throws IOException {
        //要下载的图片地址
        String path = request.getSession().getServletContext().getRealPath("/upload");
        String fileName = "基础语法.jpg";

        //1、设置response响应头
        response.reset();//设置页面而不缓存 清空buffer
        response.setCharacterEncoding("UTF-8");//字符编码
        response.setContentType("multipart/form-data");//二进制传输数据
        //设置响应头
        response.setHeader("Content-Disposition","attachment;fileName="+ URLEncoder.encode(fileName,"UTF-8"));

        File file = new File(path,fileName);
        //2、读取文件 输入流
        InputStream inputStream = new FileInputStream(file);
        //3、写出文件 输出流
        OutputStream outputStream = response.getOutputStream();

        byte[] buffer = new byte[1024];
        int len = 0;
        //4、执行 写出擦欧总
        while((len = inputStream.read(buffer)) != -1){
            outputStream.write(buffer,0,len);
            outputStream.flush();
        }
        outputStream.close();
        inputStream.close();
        return null;
    }


}
