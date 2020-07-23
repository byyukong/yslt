package cn.qas.service;

import cn.qas.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * @author GaoJianJun
 * @create 2020-07-06 17:19
 */
public interface UserService {
    //登录
    User login(User user);
    //修改最后登录时间
    int updLoginTime(Date date,String id);
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

    //根据id查询所有用户
    User getAll_Byid(String id);

    //根据id修改用户
    void UpdateByUser1(User user);

    //根据id修改用户状态
    void UpdateUserStatus(User user);

    //根据删除用户
    int deleteById(int  userid);

    //修改
    int updUserById(User user);

    //VIP
    int updVipById(String id);

    //修改头像
    int updateHead(@Param("Head_portrait") String Head_portrait, @Param("user_id") String user_id);

}
