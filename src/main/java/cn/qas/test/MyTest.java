package cn.qas.test;

import cn.qas.pojo.User;
import cn.qas.service.UserService;
import cn.qas.service.tabService;
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
        tabService tabServiceImpl = context.getBean("tabServiceImpl", tabService.class);
        System.out.println(tabServiceImpl.queryTab());
    }
}
