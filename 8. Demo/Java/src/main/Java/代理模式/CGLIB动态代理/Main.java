package 代理模式.CGLIB动态代理;

import 代理模式.JDK动态代理.JdkProxyFactory;
import 代理模式.静态代理.SmsService;
import 代理模式.静态代理.SmsServiceImpl;

public class Main {
    public static void main(String[] args) {
        AliSmsService aliSmsService = (AliSmsService) CglibProxyFactory.getProxy(AliSmsService.class);
        aliSmsService.send("java");
    }
}
