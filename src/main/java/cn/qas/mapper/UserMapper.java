package cn.qas.mapper;

import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * @author GaoJianJun
 * @create 2020-07-03 16:27
 */
public interface UserMapper {
    @Select("select * from user")
    List<Map<String,Object>> getAllUser();
}
