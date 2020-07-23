package cn.qas.controller;


import cn.qas.pojo.User;
import cn.qas.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;


@Controller
@SuppressWarnings("all")
public class FileController {
    @Autowired
    private UserService userService;
    //@RequestParam("file") 将name=file控件得到的文件封装成CommonsMultipartFile 对象
    //批量上传CommonsMultipartFile则为数组即可
    @RequestMapping("/upload")
    public String fileUpload(@RequestParam("file") CommonsMultipartFile file, @Param("user_id")String user_id, Model model, HttpServletRequest request, HttpSession session) throws IOException {
        System.out.println(user_id);
        User all_byid = userService.getAll_Byid(user_id);
        model.addAttribute("user",all_byid);
        //获取文件名 : file.getOriginalFilename();
        String uploadFileName = file.getOriginalFilename();
        //如果文件名为空，直接回到首页！
        if ("".equals(uploadFileName)){
            uploadFileName="default.jpg";
            File realPath = new File(request.getSession().getServletContext().getRealPath("//static//img"));
            if (!realPath.exists()){
                realPath.mkdir();
            }
            System.out.println("上传文件保存地址："+realPath);

            InputStream is = file.getInputStream(); //文件输入流
            OutputStream os = new FileOutputStream(new File(realPath,uploadFileName)); //文件输出流
            userService.updateHead(uploadFileName,user_id);
            //读取写出
            int len=0;
            byte[] buffer = new byte[1024];
            while ((len=is.read(buffer))!=-1){
                os.write(buffer,0,len);
                os.flush();
            }
            os.close();
            is.close();
            return "redirect:/main";
        }
        System.out.println("上传文件名 : "+uploadFileName);

        //上传路径保存设置
        //D://Mycode//Y2//yslt//src//main//webapp//static//img
        //getRealPath(request.getServletContext(),"/")
        //request.getContextPath()
        ////www//server//tomcat//webapps//yslt//static//img

        File realPath = new File(request.getSession().getServletContext().getRealPath("//static//img"));
        if (!realPath.exists()){
            realPath.mkdir();
        }
        System.out.println("上传文件保存地址："+realPath);

        InputStream is = file.getInputStream(); //文件输入流
        OutputStream os = new FileOutputStream(new File(realPath,uploadFileName)); //文件输出流
        userService.updateHead(uploadFileName,user_id);
        session.setAttribute("user",userService.getAll_Byid(user_id));
        //读取写出
        int len=0;
        byte[] buffer = new byte[1024];
        while ((len=is.read(buffer))!=-1){
            os.write(buffer,0,len);
            os.flush();
        }
        os.close();
        is.close();
        return "redirect:/main";
    }
}
