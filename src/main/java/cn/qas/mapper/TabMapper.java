package cn.qas.mapper;

import cn.qas.pojo.Tab;

import java.util.List;

/**
 * @author GaoJianJun
 * @create 2020-07-14 8:44
 */
public interface TabMapper {
    //查询所有分类
    List<Tab> queryTab();
    //删除分类 逻辑删除
    int delTab(int id);
    //恢复分类
    int cancelDelClassify(int id);
    //添加分类
    int addTab(Tab tab);
    //判断分类名是否唯一
    Tab uniquenessTabName(String tab_name);
    //回显数据
    Tab queryTabById(int tab_id);
    //修改分类
    int modifyTab(Tab tab);
}
