package cn.qas.service;

import cn.qas.pojo.Forum;

import java.util.List;

/**
 * @author GaoJianJun
 * @create 2020-07-13 14:00
 */
public interface ForumManageService {
    //查询所有版块
    List<Forum> queryForum();
    //删除版块
    int delForum(int id);
    //恢复版块
    int cancelDel(int id);
    //判断版块是否存在
    Forum uniquenessForumName(String forum_name);
    //添加版块
    int addForum(Forum forum);
    //回显数据
    Forum queryForumById(int id);
    //修改版块
    int modifyForum(Forum forum);
}
