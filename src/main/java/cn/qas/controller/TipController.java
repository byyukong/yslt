package cn.qas.controller;

import cn.qas.pojo.*;
import cn.qas.service.forumManageService;
import cn.qas.service.impl.TipServiceImpl;
import cn.qas.service.tabService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class TipController {
    @Autowired
    TipServiceImpl tipService;
    @Autowired
    private forumManageService forumManageService;
    @Autowired
    private tabService tabService;

    @RequestMapping("/main")
    public String seleall(Model model){
        List<Tip> list=tipService.seleall();
        model.addAttribute("list",list);
        return "main";
    }

    @RequestMapping("/sousuo")
    public String likese(Model model,String keyword){
        List<Tip> list=tipService.likesele(keyword);
        model.addAttribute("list",list);
        return "main";
    }

/*    @RequestMapping("/click/{id}")
    public String clickreply(Model model,@PathVariable("id") int id,@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        List<Reply> replyList=tipService.clickreply(id);
        model.addAttribute("replyList",replyList);
        Tip tip=tipService.selezuozhe(id);
        model.addAttribute("tip",tip);
        PageHelper.startPage(pn,10);
        PageInfo page=new PageInfo(replyList,10);
        return "tipContent";
    }*/

    @RequestMapping("/click/{id}")
    public ModelAndView clickreply(@PathVariable("id") int id, @RequestParam(value = "pn",defaultValue = "1")Integer pn){
        ModelAndView modelAndView = new ModelAndView();
        List<Reply> replyList=tipService.clickreply(id);
        modelAndView.addObject("replyList",replyList);
        Tip tip=tipService.selezuozhe(id);
        modelAndView.addObject("tip",tip);
        PageHelper.startPage(pn,10);
        PageInfo page=new PageInfo(replyList,10);
        modelAndView.setViewName("tipContent");
        return modelAndView;
    }


    @RequestMapping(value = "/pinglun",method = RequestMethod.GET)
    public String pinglun(@RequestParam("user_id")String user_id, @RequestParam("tip_id")String tip_id, @RequestParam("reply_content")String reply_content) {
        Reply reply = new Reply();
        reply.setUser_id(user_id);
        reply.setTip_id(Integer.parseInt(tip_id));
        reply.setReply_content(reply_content);
        reply.setReply_publishTime(new Date());
        int addreply = tipService.addreply(reply);
        return "redirect:/click/"+reply.getTip_id();
    }

    /**
     * 跳转到发帖页面并且遍历所有版块，分类
     * @param model
     * @return
     */
    @RequestMapping("/goAddTip")
    public String goAddTip(Model model){
        model.addAttribute("forum",forumManageService.queryForum());
        model.addAttribute("tab",tabService.queryTab());
        return "publishTip";
    }

    /**
     * 发帖
     * @param tip
     * @return
     */
    @RequestMapping("/addTip")
    public String addTip(Tip tip, HttpSession session){
        User user =(User) session.getAttribute("user");
        tip.setUser_id(user.getUser_id());
        tip.setTip_publishTime(new Date());
        tip.setTip_modifyTime(new Date());
        tip.setTip_click(0);
        tip.setTip_isDeleted(0);
        tip.setTip_isKnot(0);
        tip.setTip_replies(0);
        tip.setTip_isTop(0);
        tipService.addTip(tip);
        return "redirect:/main";
    }
    @RequestMapping(value = "/jietie",method = RequestMethod.GET)
    @ResponseBody
    public int jietie(@RequestParam("tip_id")int tip_id,@RequestParam("tip_isKnot")int tip_isKnot){
        int updatetip = tipService.updatetip(tip_isKnot,tip_id);
        System.out.println(updatetip);
        return updatetip;
    }

    @RequestMapping("/modify/{id}")
    public ModelAndView clickmodify(@PathVariable("id") int id){
        ModelAndView modelAndView = new ModelAndView();
        List<Reply> replyList=tipService.clickreply(id);
        modelAndView.addObject("replyList",replyList);
        List<Tip> list=tipService.seleall();
        Tip tip=tipService.selezuozhe(id);
        List<User> selectuser = tipService.selectuser();

        modelAndView.addObject("forums",forumManageService.queryForum());
        modelAndView.addObject("list",list);
        modelAndView.addObject("tip",tip);
        modelAndView.addObject("tab",tabService.queryTab());
        modelAndView.addObject("user",selectuser);
        modelAndView.setViewName("userModifyTip");
        return modelAndView;
    }

    @RequestMapping(value = "/xiugaitip",method = RequestMethod.GET)
    @ResponseBody
    public int xiug(@RequestParam("forum_id")int forum_id,@RequestParam("tab_id")int tab_id,@RequestParam("tip_title")String tip_title,@RequestParam("tip_content")String tip_content,@RequestParam("tip_modifyTime")Date tip_modifyTime,@RequestParam("tip_id")int tip_id){
        int updates = tipService.updates(forum_id,tab_id,tip_title, tip_content, tip_modifyTime, tip_id);
        return updates;
    }
}
