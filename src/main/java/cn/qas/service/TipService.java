package cn.qas.service;

import cn.qas.pojo.Reply;
import cn.qas.pojo.Tip;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TipService {
    //查询所有贴吧
    public List<Tip> seleall();
    //搜索功能
    List<Tip> likesele(String title);
    //点击帖子查询回复
    List<Reply> clickreply(int id);
}
