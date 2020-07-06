package cn.qas.test;

import cn.qas.mapper.UserMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import cn.qas.util.MybatisUtils;

import java.util.List;
import java.util.Map;

/**
 * @author GaoJianJun
 * @create 2020-07-03 16:32
 */
public class MyTest {
    @Test
    public void test1(){
        SqlSession sqlSession = MybatisUtils.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        List<Map<String, Object>> allUser = mapper.getAllUser();
        for (Map<String, Object> stringObjectMap : allUser) {
            System.out.println(stringObjectMap);
        }
    }
}
