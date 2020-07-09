package cn.qas.controller;

import cn.qas.pojo.Reply;
import cn.qas.pojo.Tip;
import cn.qas.service.impl.TipServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class TipController {
    @Autowired
    TipServiceImpl tipService;

    @RequestMapping("/main")
    public String seleall(Model model){
        List<Tip> list=tipService.seleall();
        System.out.println(list);
        model.addAttribute("list",list);
        return "main";
    }

    @RequestMapping("/sousuo")
    public String likese(Model model,String keyword){
        List<Tip> list=tipService.likesele(keyword);
        model.addAttribute("list",list);
        return "main";
    }

    @RequestMapping("/click/{id}")
    public String clickreply(Model model,@PathVariable("id") int id){
        List<Reply> replyList=tipService.clickreply(id);
        model.addAttribute("replyList",replyList);
        return "tipContent";
    }
}
