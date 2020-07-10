package cn.qas.test;

import cn.qas.pojo.User;
import cn.qas.service.UserService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author suwenwu
 * @create 2020-07-10-9:11
 */
public class Mytest02 {

    //测试查询用户
    @Test
    public void test01(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        UserService userServiceImpl = context.getBean("userServiceImpl", UserService.class);
        System.out.println(userServiceImpl.getAll());
    }
}
