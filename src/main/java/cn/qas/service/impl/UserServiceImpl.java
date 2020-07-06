package cn.qas.service.impl;

import cn.qas.mapper.UserMapper;
import cn.qas.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author GaoJianJun
 * @create 2020-07-06 17:19
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public List<Map<String, Object>> getAllUser() {
        return userMapper.getAllUser();
    }
}
