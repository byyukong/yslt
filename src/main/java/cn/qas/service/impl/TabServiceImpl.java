package cn.qas.service.impl;

import cn.qas.mapper.TabMapper;
import cn.qas.pojo.Tab;
import cn.qas.service.TabService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author GaoJianJun
 * @create 2020-07-14 8:46
 */
@Service
public class TabServiceImpl implements TabService {
    @Autowired
    private TabMapper tabMapper;
    @Override
    public List<Tab> queryTab() {
        return tabMapper.queryTab();
    }

    @Override
    public int delTab(int id) {
        return tabMapper.delTab(id);
    }

    @Override
    public int cancelDelClassify(int id) {
        return tabMapper.cancelDelClassify(id);
    }

    @Override
    public int addTab(Tab tab) {
        return tabMapper.addTab(tab);
    }

    @Override
    public Tab uniquenessTabName(String tab_name) {
        return tabMapper.uniquenessTabName(tab_name);
    }

    @Override
    public Tab queryTabById(int tab_id) {
        return tabMapper.queryTabById(tab_id);
    }

    @Override
    public int modifyTab(Tab tab) {
        return tabMapper.modifyTab(tab);
    }
}
