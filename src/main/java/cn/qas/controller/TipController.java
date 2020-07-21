package cn.qas.controller;

import cn.qas.pojo.*;
import cn.qas.service.ForumManageService;
import cn.qas.service.impl.TipServiceImpl;
import cn.qas.service.TabService;
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
    private ForumManageService forumManageService;
    @Autowired
    private TabService tabService;

    @RequestMapping("/main")
    public String seleall(@RequestParam(defaultValue = "1") Integer currentPage, Model model){
        PageHelper.startPage(currentPage,10);
        List<Tip> list=tipService.seleall();
        for (Tip tip : list) {
            int id=tip.getTip_id();
            int selectreply = tipService.selectreply(id);
            tip.setTip_replies(selectreply);
            tipService.updatetipreply(tip.getTip_replies(),tip.getTip_id());
        }
        //List<Tip> allQualification = tipService.getAllQualification();
        PageInfo page=new PageInfo(list,5);//分页
        //model.addAttribute("list",list);
        model.addAttribute("page",page);
        System.out.println(page.toString());
        model.addAttribute("code",1);
        return "main";
    }

    @RequestMapping("/sousuo")
    public String likese(Model model,String keyword,@RequestParam(defaultValue = "1") Integer currentPage){
        PageHelper.startPage(currentPage,10);
        List<Tip> list=tipService.likesele(keyword);
        PageInfo page=new PageInfo(list,5);//分页
        model.addAttribute("page",page);
        model.addAttribute("code",2);
        model.addAttribute("keyword",keyword);
        return "main";
    }

    @RequestMapping("/click/{id}")
    public String clickreply(Model model,@PathVariable("id") int id,@RequestParam(defaultValue = "1")Integer currentPage){

        tipService.updatetipclick(id);
        PageHelper.startPage(currentPage, 10);
        List<Reply> replyList=tipService.clickreply(id);
        model.addAttribute("replyList",replyList);
        Tip tip=tipService.selezuozhe(id);
        model.addAttribute("tip",tip);
        model.addAttribute("tiphf",tipService.selectreply(id));
        PageInfo page=new PageInfo(replyList,5);
        model.addAttribute("page",page);

        return "tipContent";
    }

/*    @RequestMapping("/click/{id}")
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
    }*/


    @RequestMapping(value = "/pinglun",method = RequestMethod.GET)
    public String pinglun(@RequestParam("user_id")String user_id, @RequestParam("tip_id")String tip_id, @RequestParam("reply_content")String reply_content) {
        Reply reply = new Reply();
        reply.setUser_id(user_id);
        reply.setTip_id(Integer.parseInt(tip_id));
        reply.setReply_content(reply_content);
        reply.setReply_publishTime(new Date());
        tipService.addreply(reply);
        return "redirect:/click/"+reply.getTip_id();
    }

    @RequestMapping("/delReply/{reply_id}")
    @ResponseBody
    public ModelAndView delReply(@PathVariable String reply_id){
        ModelAndView modelAndView =new ModelAndView();
        tipService.delReply(reply_id);
        modelAndView.setViewName("tipContent");
        return modelAndView;
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

    /**
     * 跳转到贴子管理页面并遍历数据
     * @param model
     * @return
     */
    @RequestMapping("/toTipAdministration")
    public String toTipAdministration(Model model,@RequestParam(defaultValue = "1") Integer currentPage){
        PageHelper.startPage(currentPage,10);
        PageInfo page=new PageInfo(tipService.queryAllTip(),5);//分页
        model.addAttribute("page",page);
        return "tipManage";
    }

    /**
     * 置顶
     * @param tid
     * @return
     */
    @RequestMapping("/addTop/{tid}")
    @ResponseBody
    public ModelAndView addTop(@PathVariable int tid){
        ModelAndView modelAndView=new ModelAndView();
        tipService.addTop(tid);
        modelAndView.setViewName("tipManage");
        return modelAndView;
    }

    /**
     * 取消置顶
     * @param tid
     * @return
     */
    @RequestMapping("/canceTop/{tid}")
    @ResponseBody
    public ModelAndView canceTop(@PathVariable int tid){
        ModelAndView modelAndView=new ModelAndView();
        tipService.canceTop(tid);
        modelAndView.setViewName("tipManage");
        return modelAndView;
    }

    /**
     * 结贴
     */
    @RequestMapping("/stick/{tid}")
    @ResponseBody
    public ModelAndView stick(@PathVariable int tid){
        ModelAndView modelAndView=new ModelAndView();
        tipService.stick(tid);
        modelAndView.setViewName("tipManage");
        return modelAndView;
    }
    /**
     * 取消结贴
     */
    @RequestMapping("/canceStick/{tid}")
    @ResponseBody
    public ModelAndView canceStick(@PathVariable int tid){
        ModelAndView modelAndView=new ModelAndView();
        tipService.canceStick(tid);
        modelAndView.setViewName("tipManage");
        return modelAndView;
    }
    /**
     * 删除
     */
    @RequestMapping("/delTip/{tid}")
    @ResponseBody
    public ModelAndView delTip(@PathVariable int tid){
        ModelAndView modelAndView=new ModelAndView();
        tipService.delTip(tid);
        modelAndView.setViewName("tipManage");
        return modelAndView;
    }
    /**
     * 取消删除
     */
    @RequestMapping("/canceDelTip/{tid}")
    @ResponseBody
    public ModelAndView canceDelTip(@PathVariable int tid){
        ModelAndView modelAndView=new ModelAndView();
        tipService.canceDelTip(tid);
        modelAndView.setViewName("tipManage");
        return modelAndView;
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
