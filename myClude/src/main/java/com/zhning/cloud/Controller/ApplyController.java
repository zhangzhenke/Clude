package com.zhning.cloud.Controller;

import com.zhning.cloud.Model.Apply;
import com.zhning.cloud.Model.User;
import com.zhning.cloud.Service.ApplyService;
import com.zhning.cloud.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import java.sql.Date;

@Controller
public class ApplyController {
    @Autowired
    private ApplyService applyService;


    /*申请权限功能*/
    @RequestMapping("/apply")
    public String toaApplypage(String user_name, Model mov) throws Exception {
        return "apply";
    }
    /*申请权限功能*/
    @RequestMapping("/toapply")
    public String toaApply(String applymanname, String applydesc, String comment, RedirectAttributes attributes) throws Exception {
       String yes =  applyService.checkApply(applymanname,applydesc);
       if(yes.equals("ok")){
           attributes.addFlashAttribute("message","重复提交！请核实你的申请");
           return "redirect:/apply";
       }

        Apply apply = new Apply();
        System.out.println(applymanname+applydesc+comment);
        apply.setApplymanname(applymanname);
        apply.setApplydesc(applydesc);
        apply.setCreatetime(new Date(new java.util.Date().getTime()));
        apply.setComment(comment);
         int res=applyService.createApply(apply);
        if(res>0){
            System.out.println("申请提交成功");
            attributes.addFlashAttribute("message","提交成功！请耐心等待");
        }else{
            attributes.addFlashAttribute("message","提交失败！请重新填写");
        }
        return "redirect:/apply";
    }

}
