package cn.qas.controller;

import cn.qas.pojo.Reply;
import cn.qas.pojo.Tip;
import cn.qas.service.impl.TipServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

@Controller
public class TipController {
    @Autowired
    TipServiceImpl tipService;

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
        reply.setUser_id(Integer.parseInt(user_id));
        reply.setTip_id(Integer.parseInt(tip_id));
        reply.setReply_content(reply_content);
        reply.setReply_publishTime(new Date());
        int addreply = tipService.addreply(reply);
        return "redirect:/click/"+reply.getTip_id();
    }
}
