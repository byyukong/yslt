package cn.qas.controller;


import cn.qas.pojo.User;
import cn.qas.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

@Controller
public class FileController {
    @Autowired
    private UserService userService;
    //@RequestParam("file") 将name=file控件得到的文件封装成CommonsMultipartFile 对象
    //批量上传CommonsMultipartFile则为数组即可
    @RequestMapping("/upload")
    public String fileUpload(@RequestParam("file") CommonsMultipartFile file, @Param("user_id")String user_id, Model model) throws IOException {
        System.out.println(user_id);
        User all_byid = userService.getAll_Byid(user_id);
        model.addAttribute("user",all_byid);
        //获取文件名 : file.getOriginalFilename();
        String uploadFileName = file.getOriginalFilename();
        //如果文件名为空，直接回到首页！
        if ("".equals(uploadFileName)){
            return "redirect:/main";
        }
        System.out.println("上传文件名 : "+uploadFileName);

        //上传路径保存设置
        File realPath = new File("D://Mycode//Y2//yslt//src//main//webapp//static//img");
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

    /*
     * 采用file.Transto 来保存上传的文件
     */
//    @RequestMapping("/upload2")
//    public String  fileUpload2(@RequestParam("file") CommonsMultipartFile file) throws IOException {
//        //上传路径保存设置
//        File realPath = new File("D://Y2//CUSTOMERS//yslt//src//main//webapp//static//img");
//        if (!realPath.exists()){
//            realPath.mkdir();
//        }
//        //上传文件地址
//        System.out.println("上传文件保存地址："+realPath);
//        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
//        file.transferTo(new File(realPath +"/"+ file.getOriginalFilename()));
//        return "redirect:/index.jsp";
//    }
//
//    @RequestMapping("/download")
//    public String downloads(HttpServletResponse response) throws Exception{
//        //要下载的图片地址
//        File realPath = new File("D://Y2//CUSTOMERS//yslt//src//main//webapp//static//img");
//        String  fileName = "IMG_0739.JPG";
//
//        //1、设置response 响应头
//        response.reset(); //设置页面不缓存,清空buffer
//        response.setCharacterEncoding("UTF-8"); //字符编码
//        response.setContentType("multipart/form-data"); //二进制传输数据
//        //设置响应头
//        response.setHeader("Content-Disposition",
//                "attachment;fileName="+ URLEncoder.encode(fileName, "UTF-8"));
//
//        File file = new File(realPath,fileName);
//        //2、 读取文件--输入流
//        InputStream input=new FileInputStream(file);
//        //3、 写出文件--输出流
//        OutputStream out = response.getOutputStream();
//
//        byte[] buff =new byte[1024];
//        int index=0;
//        //4、执行 写出操作
//        while((index= input.read(buff))!= -1){
//            out.write(buff, 0, index);
//            out.flush();
//        }
//        out.close();
//        input.close();
//        return null;
//    }
}
