package cn.qas.controller;

import cn.qas.pojo.User;
import cn.qas.service.UserService;
import cn.qas.util.Email;
import cn.qas.util.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

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
        return "redirect:/main";
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
     * @param user
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/userLogin")
    public String Login(User user, HttpSession session, Model model){
        User login = userService.login(user);
        if (login!=null){
            if(login.getUser_status()==1){
                model.addAttribute("msg","用户被封禁，请联系管理员！");
                return "login";
            }else if(login.getUser_status()==3){
                model.addAttribute("msg","用户未激活，请查看邮箱激活！");
                return "login";
            }
            session.setAttribute("user",login);
            System.out.println("测试身份："+login.getUser_type());
            //return "forward:/yukong"
            return "redirect:/yukong";
        }
        model.addAttribute("msg","用户名或密码错误！");
        return "login";
    }

    /**
     * 退出登录
     * @param session
     * @return
     */
    @RequestMapping("/logOut")
    public String logOut(HttpSession session){
        session.removeAttribute("user");
        return "redirect:/toLogin";
    }

    /**
     * 跳转到注册页面
     * @return
     */
    @RequestMapping("/toRegis")
    public String toRegis(){
        return "signUp";
    }

    /**
     * 注册
     * @param user
     * @return
     */
    @RequestMapping("/regis")
    public String regis(User user){
        System.out.println(user);
        user.setUser_id(UUIDUtils.getId());
        user.setUser_status(3);
        user.setUser_regTime(new Date());
        userService.regis(user);
        Email.runEmail(user.getUser_email(),user.getUser_id());
        return "redirect:/toLogin";
    }

    /**
     * 激活用户
     * @param code
     * @return
     */
    @RequestMapping("/activation/{code}")
    public String activation(@PathVariable String code){
        userService.activation(code);
        return "redirect:/toLogin";
    }

    @RequestMapping("/userInfo")
    public String userInfo(Model model){
        List<User> list = userService.getAll();
        model.addAttribute("list",list);
        return "userManage";
    }
}
