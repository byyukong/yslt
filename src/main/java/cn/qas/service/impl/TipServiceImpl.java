package cn.qas.service.impl;

import cn.qas.mapper.TipMapper;
import cn.qas.pojo.Reply;
import cn.qas.pojo.Tip;
import cn.qas.service.TipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
