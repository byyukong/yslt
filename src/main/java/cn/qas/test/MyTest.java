package cn.qas.test;

import cn.qas.pojo.User;
import cn.qas.service.UserService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author GaoJianJun
 * @create 2020-07-03 16:32
 */
public class MyTest {
    @Test
    public void test1(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        UserService userServiceImpl = context.getBean("userServiceImpl", UserService.class);
        User user = new User();
        user.setUser_name("1");
        user.setUser_password("1");
        System.out.println(userServiceImpl.login(user));
    }
}
