package cn.qas.mapper;

import cn.qas.pojo.User;

import java.util.List;

/**
 * @author GaoJianJun
 * @create 2020-07-03 16:27
 */
@SuppressWarnings("all")
public interface UserMapper {
    //登录
    User login(User user);

    //查询所有用户
    List<User> getAll();

    //注册
    int regis(User user);

    //激活用户
    int activation(String code);

    //判断用户名是否唯一
    User uniquenessName(String name);

    //判断邮箱是否唯一
    User uniquenessEmail(String email);

}
