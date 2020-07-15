package cn.qas.service.impl;

import cn.qas.mapper.ForumManageMapper;
import cn.qas.pojo.Forum;
import cn.qas.service.ForumManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author GaoJianJun
 * @create 2020-07-13 14:00
 */
@Service
public class ForumManageServiceImpl implements ForumManageService {
    @Autowired
    private ForumManageMapper forumManageMapper;
    @Override
    public List<Forum> queryForum() {
        return forumManageMapper.queryForum();
    }

    @Override
    public int delForum(int id) {
        return forumManageMapper.delForum(id);
    }

    @Override
    public int cancelDel(int id) {
        return forumManageMapper.cancelDel(id);
    }

    @Override
    public Forum uniquenessForumName(String forum_name) {
        return forumManageMapper.uniquenessForumName(forum_name);
    }

    @Override
    public int addForum(Forum forum) {
        return forumManageMapper.addForum(forum);
    }

    @Override
    public Forum queryForumById(int id) {
        return forumManageMapper.queryForumById(id);
    }

    @Override
    public int modifyForum(Forum forum) {
        return forumManageMapper.modifyForum(forum);
    }
}
