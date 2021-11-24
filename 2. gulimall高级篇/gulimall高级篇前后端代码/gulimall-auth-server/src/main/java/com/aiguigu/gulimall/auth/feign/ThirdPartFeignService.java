package com.aiguigu.gulimall.auth.feign;


import com.atguigu.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @Description:
 * @Created: with IntelliJ IDEA.
 * @author: 夏沫止水
 * @createTime: 2020-06-27 10:10
 **/

@FeignClient("gulimall-third-party")
public interface ThirdPartFeignService {

    @GetMapping("/sms/sendCode")
    public R sendCode(@RequestParam("phone") String phone, @RequestParam("code") String code);

}
