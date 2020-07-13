package cn.qas.service;

import cn.qas.pojo.Reply;
import cn.qas.pojo.Tip;
import org.apache.ibatis.annotations.Param;

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
    int addreply(Reply reply);
}
