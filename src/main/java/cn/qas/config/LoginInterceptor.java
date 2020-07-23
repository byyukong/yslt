package cn.qas.config;

import cn.qas.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author GaoJianJun
 * @create 2020-07-17 10:44
 */

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");

        //没登录时放行
        if(request.getRequestURI().contains("toLogin")){
            return true;
        }
        if(request.getRequestURI().contains("sousuo")){
            return true;
        }

        if(request.getRequestURI().contains("userLogin")){
            return true;
        }
        if(request.getRequestURI().contains("toRegis")){
            return true;
        }
        if(request.getRequestURI().contains("regis")){
            return true;
        }
        if(request.getRequestURI().contains("activation")){
            return true;
        }
        if(request.getRequestURI().contains("uniquenessName")){
            return true;
        }
        if(request.getRequestURI().contains("uniquenessEmail")){
            return true;
        }
        if(request.getRequestURI().contains("main")){
            return true;
        }
        if(request.getRequestURI().contains("click")){
            return true;
        }
        if(request.getRequestURI().contains("logOut")){
            return true;
        }

        //登录时放行
        if (user!=null) {
            System.out.println("获取用户类型："+user.getUser_type());
            if (user.getUser_type()!=2){
                System.out.println("获取用户类型："+user.getUser_type());
                request.getRequestURI().contains("/**");
                return true;
            }
            if (request.getRequestURI().contains("upload")) {
                return true;
            }
            if (request.getRequestURI().contains("goAddTip")) {
                return true;
            }
            if (request.getRequestURI().contains("addTip")) {
                return true;
            }
            if (request.getRequestURI().contains("pinglun")) {
                return true;
            }
            if (request.getRequestURI().contains("jietie")) {
                return true;
            }
            if (request.getRequestURI().contains("modify")) {
                return true;
            }
            if (request.getRequestURI().contains("xiugaitip")) {
                return true;
            }
            if (request.getRequestURI().contains("aliPay")) {
                return true;
            }
            if(request.getRequestURI().contains("updVip")){
                return true;
            }
            if(request.getRequestURI().contains("delReply")){
                return true;
            }
            if (request.getRequestURI().contains("toUpdate_userInfo")) {
                return true;
            }
            if (request.getRequestURI().contains("update_userInfo")) {
                return true;
            }
        }

        //没有登录跳转到登录页面
        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request,response);
        return false;
    }
}
