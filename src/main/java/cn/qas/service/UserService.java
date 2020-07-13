package cn.qas.service;

import cn.qas.pojo.User;

import java.util.List;

/**
 * @author GaoJianJun
 * @create 2020-07-06 17:19
 */
public interface UserService {
    //登录
    User login(User user);
    //注册
    int regis(User user);
    //激活用户
    int activation(String code);
    //判断用户名是否唯一
    User uniquenessName(String name);
    //判断用户名是否唯一
    User uniquenessEmail(String email);

    //查询所有用户
    List<User> getAll();
}
