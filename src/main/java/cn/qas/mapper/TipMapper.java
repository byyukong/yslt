package cn.qas.mapper;

import cn.qas.pojo.Reply;
import cn.qas.pojo.Tip;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface TipMapper {
    //查询所有帖子
    List<Tip> seleall();
    //搜索功能
    List<Tip> likesele(@Param("title") String title);
    //点击帖子查询回复
    List<Reply> clickreply(@Param("id") int id);
}
