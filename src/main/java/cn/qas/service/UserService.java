package cn.qas.service;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

/**
 * @author GaoJianJun
 * @create 2020-07-06 17:19
 */
public interface UserService {
    List<Map<String,Object>> getAllUser();
}
