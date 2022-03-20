package 代理模式.JDK动态代理;

import 代理模式.静态代理.SmsProxy;
import 代理模式.静态代理.SmsService;
import 代理模式.静态代理.SmsServiceImpl;

public class Main {
    public static void main(String[] args) {
        SmsService smsService = (SmsService) JdkProxyFactory.getProxy(new SmsServiceImpl());
        smsService.send("java");
    }
}
