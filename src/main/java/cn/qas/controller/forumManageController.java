package cn.qas.controller;

import cn.qas.pojo.Forum;
import cn.qas.pojo.User;
import cn.qas.service.forumManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * @author GaoJianJun
 * @create 2020-07-13 12:19
 */
@Controller
public class forumManageController {
    @Autowired
    private forumManageService forumManageService;

    /**
     * 跳转到版块并且查询所有版块
     * @param model
     * @return
     */
    @RequestMapping("/toForumManage")
    public String toForumManage(Model model){
        model.addAttribute("forum",forumManageService.queryForum());
        return "forumManage";
    }

    /**
     * 删除版块 逻辑删除
     * @param id
     * @return
     */
    @RequestMapping("/delForumManage/{id}")
    public String delForumManage(@PathVariable int id){
        forumManageService.delForum(id);
        return "redirect:/toForumManage";
    }

    /**
     * 恢复版块
     * @param id
     * @return
     */
    @RequestMapping("/cancelDel/{id}")
    public String cancelDel(@PathVariable int id){
        forumManageService.cancelDel(id);
        return "redirect:/toForumManage";
    }

    /**
     * 跳转到添加版块
     * @return
     */
    @RequestMapping("/toAddForum")
    public String toAddForum(){
        return "addForum";
    }

    /**
     * 判断版块名是否存在
     * @param forum_name
     * @return
     */
    @RequestMapping("/uniquenessForumName")
    @ResponseBody
    public String uniquenessForumName(String forum_name){
        Forum forum = forumManageService.uniquenessForumName(forum_name);
        if (forum!=null){
            return "0";
        }
        return "1";
    }

    /**
     * 添加版块
     * @param forum
     * @return
     */
    @RequestMapping("/addForum")
    public String addForum(Forum forum){
        forum.setForum_isDeleted(0);
        forum.setForum_createTime(new Date());
        forum.setForum_modifyTime(new Date());
        forumManageService.addForum(forum);
        return "redirect:/toForumManage";
    }

    /**
     * 跳转到修改版块  回显数据
     * @param id
     * @return
     */
    @RequestMapping("/toModifyForum/{id}")
    public String toModifyForum(@PathVariable int id,Model model){
        model.addAttribute("forum",forumManageService.queryForumById(id));
        return "modifyForum";
    }

    /**
     * 修改版块
     * @param forum
     * @return
     */
    @RequestMapping("/modifyForum")
    public String modifyForum(Forum forum){
        forum.setForum_modifyTime(new Date());
        forumManageService.modifyForum(forum);
        return "redirect:/toForumManage";
    }
}
