package cn.qas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author GaoJianJun
 * @create 2020-07-07 8:26
 */
@Controller
public class LoginController {
    @RequestMapping("/yukong")
    public String c(){
        System.out.println("测试");
        return "main";
    }
}
