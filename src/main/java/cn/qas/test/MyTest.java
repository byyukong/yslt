package cn.qas.test;

import cn.qas.mapper.UserMapper;
import cn.qas.service.UserService;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import cn.qas.util.MybatisUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;
import java.util.Map;

/**
 * @author GaoJianJun
 * @create 2020-07-03 16:32
 */
public class MyTest {
    @Test
    public void test1(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        UserService userServiceImpl = context.getBean("userServiceImpl", UserService.class);
        System.out.println(userServiceImpl.getAllUser());
    }
}
