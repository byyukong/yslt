package cn.qas.mapper;

import cn.qas.pojo.User;

import java.util.List;

/**
 * @author GaoJianJun
 * @create 2020-07-03 16:27
 */
public interface UserMapper {
    //登录
    User login(User user);

    //查询所有用户
    List<User> getAll();

}
