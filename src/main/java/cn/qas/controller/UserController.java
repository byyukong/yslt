package cn.qas.controller;

import cn.qas.pojo.Msg;
import cn.qas.pojo.User;
import cn.qas.service.UserService;
import cn.qas.util.Email;
import cn.qas.util.UUIDUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

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
            //修改最后登录时间
            userService.updLoginTime(new Date(),login.getUser_id());
            session.setAttribute("user",login);
            System.out.println("测试身份："+login.getUser_type());
            //return "forward:/yukong"
            return "redirect:/main";
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
        user.setIs_Vip(0);
        user.setActivate(UUIDUtils.getId());
        userService.regis(user);
        Email.runEmail(user.getUser_email(),user.getActivate());
        return "redirect:/toLogin";
    }

    /**
     * 激活用户
     * @param code
     * @return
     */
    @RequestMapping("/activation/{code}")
    public String activation(@PathVariable String code,Model model){
        userService.activation(code);
        model.addAttribute("msg","激活成功，请登录！");
        return "forward:/toLogin";
    }

    /**
     * 判断name是否唯一
     * @param name
     * @return
     */
    @RequestMapping("/uniquenessName")
    @ResponseBody
    public String uniquenessName(String name){
        User user = userService.uniquenessName(name);
        if (user!=null){
            return "0";
        }
        return "1";
    }

    /**
     * 判断enail是否唯一
     * @param email
     * @return
     */
    @RequestMapping("/uniquenessEmail")
    @ResponseBody
    public String uniquenessEmail(String email){
        User user = userService.uniquenessEmail(email);
        if (user!=null){
            return "0";
        }
        return "1";
    }

    @RequestMapping("/userInfo")
    public String userInfo(Model model,@RequestParam(defaultValue = "1") Integer currentPage){
        PageHelper.startPage(currentPage,10);
        List<User> list = userService.getAll();
        PageInfo page=new PageInfo(list,5);//分页
        model.addAttribute("page",page);
        return "userManage";
    }




    /**
     * 根据id查询用户信息
     * @PathVariable 标志从路径中取出id占位符的值
     */
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable String id){
        User user=userService.getAll_Byid(id);
        return Msg.success().add("user",user);
    }

    /**
     * 更新用户信息  此处使用empId 和映射文件id保持一致
     */
    @RequestMapping(value = "/emp1/{aid}",method = RequestMethod.GET)
    @ResponseBody
    public Msg updateEmp(User user,@PathVariable String aid){
        user.setUser_id(aid);
        userService.UpdateByUser1(user);
        return Msg.success();

    }

    /**
     * 更新用户状态1  此处使用uId
     */
    @RequestMapping(value = "/emp2/{uid}",method = RequestMethod.GET)
    @ResponseBody
    public Msg updateEmp_status1(User user,@PathVariable String uid,@RequestParam int status1){
        user.setUser_id(uid);
        user.setUser_status(status1);
        userService.UpdateUserStatus(user);
        return Msg.success();

    }

    /**
     * 更新用户状态2  此处使用uId
     */
    @RequestMapping(value = "/emp3/{uid}",method = RequestMethod.GET)
    @ResponseBody
    public Msg updateEmp_status2(User user,@PathVariable String uid,@RequestParam int status2){

        user.setUser_id(uid);
        user.setUser_status(status2);
        userService.UpdateUserStatus(user);
        return Msg.success();

    }



    /**
     * 根据id删除用户信息
     * @PathVariable 标志从路径中取出id占位符的值
     */
    @RequestMapping(value = "/emp_del/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg delUser(@PathVariable("id") int id){
        int i = userService.deleteById(id);
        return Msg.success().add("i",i);
    }

    /**
     * 跳转到修改用户信息    回显数据
     * @param uId
     * @param model
     * @return
     */
    @RequestMapping("/toUpdate_userInfo/{uId}")
    public String toUpdate_userInfo(@PathVariable String uId,Model model){
        model.addAttribute("user",userService.getAll_Byid(uId));
        return "update_userInfo";
    }
    @RequestMapping("/updVip/{id}")
    public String updVip(@PathVariable int id){
        userService.updVipById(id);
        return "redirect:/main";
    }

    /**
     * 修改用户
     * @param id
     * @param user
     * @return
     */
    @RequestMapping("/update_userInfo/{id}")
    @ResponseBody
    public String update_userInfo(@PathVariable String id, User user){
        user.setUser_id(id);
        user.setUser_modifyTime(new Date());
        System.out.println(user);
        if (userService.updUserById(user)>0){
            return "0";
        }
        return "1";
    }
}
