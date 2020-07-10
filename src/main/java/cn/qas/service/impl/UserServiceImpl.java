package cn.qas.service.impl;

import cn.qas.mapper.UserMapper;
import cn.qas.pojo.User;
import cn.qas.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public List<User> getAll() {
        return userMapper.getAll();
    }
}
