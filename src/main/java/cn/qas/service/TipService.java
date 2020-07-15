package cn.qas.service;

import cn.qas.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface TipService {
    //查询所有贴吧
    public List<Tip> seleall();
    //搜索功能
    List<Tip> likesele(@Param("title") String title);
    //点击帖子查询回复
    List<Reply> clickreply(@Param("id")int id);
    //查询帖子时的作者
    Tip selezuozhe(@Param("id")int id);
    //回复
    int addreply(Reply reply);
    //添加帖子
    int addTip(Tip tip);
    //是否结贴
    int updatetip(@Param("tip_isKnot")int tip_isKnot,@Param("tip_id")int tip_id);
    //查询板块
    List<Forum> selectForum();
    //查询分类
    List<Tab>selecttab();
    //查询全部作者
    List<User>selectuser();
    //修改帖子
    int updates(@Param("forum_id")int forum_id, @Param("tab_id")int tab_id, @Param("tip_title")String tip_title, @Param("tip_content")String tip_content, @Param("tip_modifyTime") Date tip_modifyTime, @Param("tip_id")int tip_id);

}
