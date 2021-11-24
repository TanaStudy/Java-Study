package com.aiguigu.gulimall.auth.feign;


import com.aiguigu.gulimall.auth.vo.SocialUser;
import com.aiguigu.gulimall.auth.vo.UserLoginVo;
import com.aiguigu.gulimall.auth.vo.UserRegisterVo;
import com.atguigu.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @Description:
 * @Created: with IntelliJ IDEA.
 * @author: 夏沫止水
 * @createTime: 2020-06-27 17:10
 **/

@FeignClient("gulimall-member")
public interface MemberFeignService {

    @PostMapping(value = "/member/member/register")
    R register(@RequestBody UserRegisterVo vo);


    @PostMapping(value = "/member/member/login")
    R login(@RequestBody UserLoginVo vo);

    @PostMapping(value = "/member/member/oauth2/login")
    R oauthLogin(@RequestBody SocialUser socialUser) throws Exception;
//
//    @PostMapping(value = "/member/member/weixin/login")
//    R weixinLogin(@RequestParam("accessTokenInfo") String accessTokenInfo);
}
