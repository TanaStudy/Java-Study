package com.atguigu.gulimall.order.config;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;

import com.atguigu.gulimall.order.vo.PayVo;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@ConfigurationProperties(prefix = "alipay")
@Component
@Data
public class AlipayTemplate {

    //在支付宝创建的应用的id
    private   String app_id = "2021000118607124";

    // 商户私钥，您的PKCS8格式RSA2私钥
    private  String merchant_private_key = "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCDVw5fPH80rq2r5qMiEH8Q+A1GfNMH8V1a1NY6F1azxTXljBN/S5eGyJaBGA2THQ3Sck2EEiLNhf9gBh40JPiGQStC6DAXyznud0PiCBtUeGkK37HYjI5VRjgNdraNBIMGO3QTLk/Dx+50gCxXLzOv96B+aaZwNlWeaDoSmbwb3gtbcQxdrR4kL9TQQdg8ftiGkR7DiCYB1pT9vfPD91rqyp9z/h56qlm41IISU7a1LeBUV9q2iIuIJ4CpHCwgD9WUaXGNHO3aHsQLe10pydsuA6oXOFdniq4AtUWoMVPqhGeoc5iIUU5fHS9DSZQuWcrw8VPoTKCx7Wg5V8hWp1S/AgMBAAECggEAC+f3aJC+Y1M2cS/eN/dQ3YPvCCXGp6CsutAyf1+gP3mwMhfpqI98s/45DojUqjJnD13HQyK1vvXXuae0UzvKv7jmqBEOUwncPY7YO4RKnfSwaQjwQVY0jOxppmbNk6kGC6mWEysOlgvoxOzdmCWyRNBo3yzKpr92MX73TLpdABWWncAcANdJDdEVL+ourKY+al7YyScDYi3ZMJsupEv8pGwPQpojJ8zpGfDmAIdBztBH0MSsAZ2Ok0Z/eejiqX9ZitjPj320bgAME8kDpcqnqoL4Nf+BTOlZjkRhflRAksLPLINpg4eI6lp9yqR0w00nPxu7sWBNVf42obVYQkhA+QKBgQDBIvy4ycrcjTk0ja3KQXclCbC9gryyHM6D185S3TSzKeLJ5TO78t3B/gVQnaZ/RA2jEncQgTxbppl64+CsepM/OGnGwxQ1SbJ57pO4lKDZ1fRauuXintAtemHt9tcqgn7UQ/4Z3O8k2PRU119h5+cVPgKaOX9pYMQaDftd2cu5nQKBgQCuFuYYgL0+//gBNqtiW9uS4o75tPmfXVRzSdt+n7hnA59Tp6L3tkp2xaAC/GZymhngvXvArD7zN49eedoL7qdUz3c5tP6ZHvIJ6lsbQw9YxGedOfK9VJJoaRzuASqjIthgchfmvDrNL6jeVkXVCbzCLxOpj/L5xXBKmKOlUnpXCwKBgQCOEwC5pqf2SmT0hex8RmAw/Mno/s10cMByOERsrJDh40QTpOnDrsr2s7iRLweVwygM975ig8801H8+6XcTKjA7Z3JYZpTtBkOmcpx0QdF5rWxNegM2DAG0Er0LYnOxr8FAwKuhtuaswnQqHSzrRr6036LmdLmHeUmIqRRqW5cD+QKBgQCaWPEOfm3LQnSm1sqivSBzHW14FS1QTxYF1VDG9mMu6jZDnBhQGY3xugvBOfi22MvixvzGebCiQPta3xwkgiZXek2Rm1gzeA1OHztBc3ZS1GetLWh61lWsPq2Ikv4zfzxqXh200+QqcXv+DG2DkUuKuuRq7JaXPqbtbGGCvRp8uwKBgQCOCE/Dan1JgkJY0rawjEy//FUQqsGer3TXF0bxubh5OlHM4A1tI0eQbMvQRvksJpHXmec3N8PbalwFHn2q2sAC+xDYWI3AIcgA/zsfQXdQMg1SHfqroGmkUX3EDa1KV0BHCN8ENnyORRlhVWsVCkYom37gvjPzbobiWOrSlFNBAg==";
    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    private  String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAkpOa6KxyQo/6NlrBCKuRERedE/p6QIb9OUL//FooI/t8ek58F9OCN65PG6pK1TUNdOLK8/h1oz28dVv9ID4MToruDmAKIi80CwkqFJ5ZisXCUoKl46qnbrn74ouWee/kzL4Q6wmj1OwVVvWGvTZ4UOH+TQo/LsT1R7SeTP3e/N+16yYVZXyuk1FP2rrCdTb52SSMuwTAEzYOih5aVPeX0NqCaZI+WN7YWHUfAmVrMvl4xNcOsx5wxwVEjpN0D3pc9rlOtPiAFzUODvf9PkcB7OIZSDZm8sGYuPBiClaZKhqI3q5Wd8xwiWKJgGQofLzVuN2tU4mdaSAWbqfVCWLOQQIDAQAB";
    // 服务器[异步通知]页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    // 支付宝会悄悄的给我们发送一个请求，告诉我们支付成功的信息  http://2f4tb.cdhttp.cn/payed/notify
    private  String notify_url = "http://2f4tb.cdhttp.cn/payed/notify";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    //同步通知，支付成功，一般跳转到成功页
    private  String return_url = "http://member.gulimall.com/memberOrder.html";

    // 签名方式
    private  String sign_type = "RSA2";

    // 字符编码格式
    private  String charset = "utf-8";

    private String timeout = "30m";

    // 支付宝网关； https://openapi.alipaydev.com/gateway.do
    private  String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    public  String pay(PayVo vo) throws AlipayApiException {

        //AlipayClient alipayClient = new DefaultAlipayClient(AlipayTemplate.gatewayUrl, AlipayTemplate.app_id, AlipayTemplate.merchant_private_key, "json", AlipayTemplate.charset, AlipayTemplate.alipay_public_key, AlipayTemplate.sign_type);
        //1、根据支付宝的配置生成一个支付客户端
        AlipayClient alipayClient = new DefaultAlipayClient(gatewayUrl,
                app_id, merchant_private_key, "json",
                charset, alipay_public_key, sign_type);

        //2、创建一个支付请求 //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(return_url);
        alipayRequest.setNotifyUrl(notify_url);

        //商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = vo.getOut_trade_no();
        //付款金额，必填
        String total_amount = vo.getTotal_amount();
        //订单名称，必填
        String subject = vo.getSubject();
        //商品描述，可空
        String body = vo.getBody();

        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"total_amount\":\""+ total_amount +"\","
                + "\"subject\":\""+ subject +"\","
                + "\"body\":\""+ body +"\","
                + "\"timeout_express\":\""+timeout+"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        String result = alipayClient.pageExecute(alipayRequest).getBody();

        //会收到支付宝的响应，响应的是一个页面，只要浏览器显示这个页面，就会自动来到支付宝的收银台页面
        System.out.println("支付宝的响应："+result);

        return result;

    }
}
