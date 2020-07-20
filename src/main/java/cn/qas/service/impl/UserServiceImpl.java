package cn.qas.service.impl;

import cn.qas.mapper.UserMapper;
import cn.qas.pojo.User;
import cn.qas.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author GaoJianJun
 * @create 2020-07-06 17:19
 */
@Service
public class UserServiceImpl implements UserService {

    private UserMapper userMapper;
    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    public User login(User user) {
        return userMapper.login(user);
    }

    @Override
    public int updLoginTime(Date date,String id) {
        return userMapper.updLoginTime(date,id);
    }

    @Override
    public List<User> getAll() {
        return userMapper.getAll();
    }

    @Override
    public User getAll_Byid(String id) {
        return userMapper.getAll_Byid(id);
    }

    @Override
    public void UpdateByUser1(User user) {
        userMapper.UpdateByUser(user);
    }

    @Override
    public void UpdateUserStatus(User user) {
        userMapper.UpdateUserStatus(user);
    }

    @Override
    public int deleteById(int userid) {
        return userMapper.deleteById(userid);
    }

    @Override
    public int updUserById(User user) {
        return userMapper.updUserById(user);
    }

    public int regis(User user) {
        return userMapper.regis(user);
    }

    @Override
    public int activation(String code) {
        return userMapper.activation(code);
    }

    @Override
    public User uniquenessName(String name) {
        return userMapper.uniquenessName(name);
    }

    @Override
    public User uniquenessEmail(String email) {
        return userMapper.uniquenessEmail(email);
    }
}
