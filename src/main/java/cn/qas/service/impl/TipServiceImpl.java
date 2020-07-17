package cn.qas.service.impl;

import cn.qas.mapper.TipMapper;
import cn.qas.pojo.*;
import cn.qas.service.TipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("tipService")
public class TipServiceImpl implements TipService {
    @Autowired
    private TipMapper tipMapper;

    @Override
    public List<Tip> seleall() {
       return tipMapper.seleall();
    }

    @Override
    public List<Tip> likesele(String title) {
        return tipMapper.likesele(title);
    }

    @Override
    public List<Reply> clickreply(int id) {
        return tipMapper.clickreply(id);
    }

    @Override
    public Tip selezuozhe(int id) {
        return tipMapper.selezuozhe(id);
    }

    @Override
    public int addreply(Reply reply) {
        return tipMapper.addreply(reply);
    }

    @Override
    public int addTip(Tip tip) {
        return tipMapper.addTip(tip);
    }
    @Override
    public int updatetip(int tip_isKnot,int tip_id) {
        return tipMapper.updatetip(tip_isKnot,tip_id);
    }

    @Override
    public List<Forum> selectForum() {
        return tipMapper.selectForum();
    }

    @Override
    public List<Tab> selecttab() {
        return tipMapper.selecttab();
    }

    @Override
    public List<User> selectuser() {
        return tipMapper.selectuser();
    }

    @Override
    public int updates(int forum_id, int tab_id, String tip_title, String tip_content, Date tip_modifyTime, int tip_id) {
        return tipMapper.updates(forum_id,tab_id,tip_title,tip_content,tip_modifyTime,tip_id);
    }

    @Override
    public int addTop(int tid) {
        return tipMapper.addTop(tid);
    }

    @Override
    public int canceTop(int tid) {
        return tipMapper.canceTop(tid);
    }

    @Override
    public int stick(int tid) {
        return tipMapper.stick(tid);
    }

    @Override
    public int canceStick(int tid) {
        return tipMapper.canceStick(tid);
    }

    @Override
    public int delTip(int tid) {
        return tipMapper.delTip(tid);
    }

    @Override
    public int canceDelTip(int tid) {
        return tipMapper.canceDelTip(tid);
    }
    @Override
    public int selectreply(int tip_id) {
        return tipMapper.selectreply(tip_id);
    }
    @Override
    public int updatetipreply(int tip_replies, int tip_id) {
        return tipMapper.updatetipreply(tip_replies,tip_id);
    }

    @Override
    public int selectclick(int tip_id) {
        return tipMapper.selectclick(tip_id);
    }

    @Override
    public int updatetipclick(int tip_click, int tip_id) {
        return tipMapper.updatetipclick(tip_click,tip_id);
    }
}
