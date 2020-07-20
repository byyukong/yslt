package cn.qas.mapper;

import cn.qas.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * @author GaoJianJun
 * @create 2020-07-03 16:27
 */
@SuppressWarnings("all")
public interface UserMapper {
    //登录
    User login(User user);

    //修改最后登录时间
    int updLoginTime(@Param("date") Date date,@Param("id") String id);

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


    //根据id查询所有用户
    User getAll_Byid(String id);

    //根据id修改用户
    int UpdateByUser(User user);

    //根据id修改用户状态
    int UpdateUserStatus(User user);

    //根据删除用户
    int deleteById(int id);

    //修改
    int updUserById(User user);

}
