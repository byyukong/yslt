package cn.qas.test;

import cn.qas.service.TabService;
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
        TabService tabServiceImpl = context.getBean("tabServiceImpl", TabService.class);
        System.out.println(tabServiceImpl.queryTab());
    }
}
