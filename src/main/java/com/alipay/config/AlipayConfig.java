package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016102200741028";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCcodc5nP2CWDogNb534WqyLQ+38JavmCKrG4d+8d8X9UgxbZ21fkOF/7GLHf2jwVok9MCditWcRvR/ZS0f5iCVFofC7CjXQu8xh2yjdrWMkrHTT42If2IzY6Y+jbnvPK4BfeHTqR1O3DCgpBnvu41bJ02kLXInlRQKHrqdt3lYMAZmeWx7RYLXmELtKTwdiE0UlnaeQsjGueWgCy65cytjpTj1NTsQFKrsGy4Fx4LV9YsasiQLTR6a9KaFMyJ+nmfow3oZM/KYDeQgS115PmnqX4rJRa297Yi3yjQEXD0S3pArR4pSy4HQ15+BGIYk00RYeum71J+vk6imayEv0O7VAgMBAAECggEAAroamikujLdmg6sL3uBw0BtSu7wXk4UNjXcUO9SQMsWVdS7YYRGKsWmLOMXT5ab3H8+XDucc4vSlSxaC25xREudqg61C5MSIj48xCAOIE6N2LxyidS7qkcR5X3tuMkkXKnV7mgjGttnEivdwcCkOw/iCNIqKA0BoMejpDNfl5/AfIJO4YDWUL69w05q/PLaltbfidVjQrcTbtc5g97OS0VSbZ1t1HYQ0gXqZVlQatnMzqgwF/otFlG9C+K+g2IOvoiuKsWBY314rhBdb3avvy4Lxhsiud3rEWg8b3vwiM64aoU56+HIoeoSH1J+6Qw7OviY4gfjW0648BcNKCvaoAQKBgQDT2up5E1oI18EvlNhKJf0+XvdLwORhEjTWrb+GTNmKkP4FomlQeamQsEU8NNTvUYp3obTebe85+Q4aCJKMdvhkeDmkEmBtwERQTPzmMHyNKd22zmwM6EjMpNrUXoPClGypeCObrXTZuNLr6SYyfLDeQBpo4ZOEUFLziEqJOvs6AQKBgQC9RSRjYTL1yhOKBhHvK9iXttWl/SrLpAVJlLct5zTFo+PWqzoynU1ByvTyutxa2l58a1+Iy/mTB5LFCdepEaAlk0aOsnTH/et7iRHlqi0A/5y+RxZf9QCJoYcPTeTG0dcFHwjyQJHn4teGr5qgNpcc9kgf4kDtfC6Zvu1B99Gs1QKBgBwx3Fa0vpzCqhE9C/QCTkvIs7y/NSW+GI4hnYWwIJuSZFw3mzB8oJaC/xPeLCCVh4oYWUvo8ZeTj87jKS3Mf45PecxeLbsthWnydQ3lkg3vbnRv0G1/VID3x6/PzFVPD48WUBbd5Nk9AcUnyE+bzKYnfdxLeSh40DFdCB5vXRQBAoGAE5hR8RwCC6JVLYf9WVafwO1D50BzqsubZIfKAy2ZsBCMqQ/nIZBZjEM34t1nrNxIxfbT2DTN7OPu1Ql002MowlsiBeoB3yaxt4N0X+OjbyQHlUeE0IBsAtO/SN1WnyLgcP5KjdITiP9aMu6BQq8ELBJvWyWwdSXTKUW0CI1gntUCgYA9a+SCB6kUAALZAYO2HlgK7OczPpn5Aj5k9+cApcc5nXJPI5OSqYMKuBbDvb/l0BVRg+N/esvgFIIxhdLJLwfaa9nGm43bvIdq+Irtlr9JmzAAUyQ5Zu/mo7IHcMgY0ixF8SmJdLcjH0i6uyCLQretxbhP9pG8NqiutdYNlvFbZQ==";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArrQu5ms20uvivbYwtjk3+Q7Iffq3GfDJmV6qflU976ewS7NHjV4OKXpkdIJcTj0OnQiY0MrY7Jw6BHULeh3Tb2djLpIc4tgKS8mykA91ziZQkrynYpUr3I6KZzc6sRj+PK/OaKiCtGIteRRo6xmD8s7T1Ub71bj4PZoZJvcMZyDsXQTQjB+gYfjfNV0eX8uIYGldA5vq+ZrXR2mVS+Wr7qROK6xYNLmmXW1ja6xpPGjs8XEY8SmTXCNYsrvj7JTywvDBoup2g4Np4r6Qd/3eQcTHdb4zGVIkgF/9gi7hbXM482pmtiASOyTURl8ehwsfrQHfMnRwZV356GOg4KXsYQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://106.52.185.64/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://106.52.185.64/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "D:\\log";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

