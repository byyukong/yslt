package cn.qas.service;

import cn.qas.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author GaoJianJun
 * @create 2020-07-06 17:19
 */
public interface UserService {
    //登录
    User login(User user);
}
