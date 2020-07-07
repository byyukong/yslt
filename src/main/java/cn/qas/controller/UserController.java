package cn.qas.controller;

import cn.qas.pojo.User;
import cn.qas.service.UserService;
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
public class UserController {
    @Autowired
    private UserService userService;
    /**
     * 跳转到首页
     * @return
     */
    @RequestMapping("/yukong")
    public String c(){
        return "main";
    }

    /**
     * 跳转到登录页面方法
     * @return
     */
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }
    /**
     * 登录方法
     * @return
     */
    @RequestMapping("/userLogin")
    public String Login(User user, HttpSession session, Model model){
        User login = userService.login(user);
        if (login!=null){
            session.setAttribute("userName",user.getUser_name());
            model.addAttribute("identity",login.getUser_type());
            System.out.println("测试身份："+login.getUser_type());
            //return "forward:/yukong"
            return "forward:/yukong";
        }
        model.addAttribute("msg","用户名或密码错误！");
        return "login";
    }

    /**
     * 退出登录
     * @return
     */
    @RequestMapping("/logOut")
    public String logOut(HttpSession session){
        session.removeAttribute("userName");
        return "redirect:/toLogin";
    }
}
