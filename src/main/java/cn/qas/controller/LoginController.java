package cn.qas.controller;

import cn.qas.pojo.User;
import cn.qas.service.UserService;
import cn.qas.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * @author GaoJianJun
 * @create 2020-07-07 8:26
 */
@Controller
public class LoginController {
    @Autowired
    private UserService userService;

    @RequestMapping("/yukong")
    public String c(){
        System.out.println("测试");
        return "main";
    }
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }
    @RequestMapping("/userLogin")
    public String Login(User user, HttpSession session, Model model){
        User login = userService.login(user);
        System.out.println(""+login);
        if (login!=null){
            session.setAttribute("userName",user.getUser_name());
            return "main";
        }
        model.addAttribute("msg","用户名或密码错误！");
        return "login";
    }
}
