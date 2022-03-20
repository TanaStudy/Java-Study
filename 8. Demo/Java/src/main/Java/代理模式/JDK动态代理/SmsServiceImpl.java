package 代理模式.JDK动态代理;

public class SmsServiceImpl {
    public String send(String message) {
        System.out.println("send message:" + message);
        return message;
    }
}
