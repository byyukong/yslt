package cn.qas.mapper;

import cn.qas.pojo.User;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author GaoJianJun
 * @create 2020-07-03 16:27
 */
public interface UserMapper {
    //登录
    User login(User user);

}
