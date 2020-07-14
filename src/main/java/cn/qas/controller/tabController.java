package cn.qas.controller;

import cn.qas.pojo.Forum;
import cn.qas.pojo.Tab;
import cn.qas.service.forumManageService;
import cn.qas.service.tabService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * @author GaoJianJun
 * @create 2020-07-14 8:48
 */
@Controller
public class tabController {
    @Autowired
    private tabService tabService;
    @Autowired
    private forumManageService forumManageService;

    /**
     * 跳转到分类页面并回显数据
     * @param model
     * @return
     */
    @RequestMapping("/toTab")
    public String toTab(Model model){
        model.addAttribute("tab",tabService.queryTab());
        return "tabManage";
    }

    /**
     * 删除分类 逻辑删除
     * @param id
     * @return
     */
    @RequestMapping("/delTab/{id}")
    public String delTab(@PathVariable int id){
        tabService.delTab(id);
        return "redirect:/toTab";
    }

    /**
     * 恢复分类
     * @param id
     * @return
     */
    @RequestMapping("/cancelDelClassify/{id}")
    public String cancelDelClassify(@PathVariable int id){
        tabService.cancelDelClassify(id);
        return "redirect:/toTab";
    }

    /**
     * 跳转到添加分类  遍历所有版块
     * @return
     */
    @RequestMapping("/goAddTab")
    public String goAddTab(Model model){
        model.addAttribute("forum",forumManageService.queryForum());
        return "addTab";
    }

    /**
     * 添加分类
     * @param tab
     * @return
     */
    @RequestMapping("/addTab")
    public String addTab(Tab tab){
        tab.setTab_isDeleted(0);
        tab.setTab_createTime(new Date());
        tab.setTab_modifyTime(new Date());
        tabService.addTab(tab);
        return "redirect:/toTab";
    }

    /**
     * 判断分类名是否唯一
     * @param tab_name
     * @return
     */
    @RequestMapping("/uniquenessTabName")
    @ResponseBody
    public String uniquenessTabName(String tab_name){
        Tab tab=tabService.uniquenessTabName(tab_name);
        if (tab!=null){
            return "0";
        }
        return "1";
    }

    /**
     * 跳转到修改分类并且回显数据
     * @param tab_id
     * @param model
     * @return
     */
    @RequestMapping("/toModifyTab/{tab_id}")
    public String toModifyTab(@PathVariable int tab_id,Model model){
        model.addAttribute("forum",forumManageService.queryForum());
        model.addAttribute("tab",tabService.queryTabById(tab_id));
        return "modifyTab";
    }
    @RequestMapping("/modifyTab")
    public String modifyTab(Tab tab){
        tab.setTab_modifyTime(new Date());
        tabService.modifyTab(tab);
        return "redirect:/toTab";
    }
}
