package com.zhning.cloud.Controller;

import com.zhning.cloud.Model.Page;
import com.zhning.cloud.Model.PageBean;
import com.zhning.cloud.Model.User;
import com.zhning.cloud.Service.FileService;
import com.zhning.cloud.Service.UserService;
import com.zhning.cloud.Util.OBSUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;

import static java.lang.System.out;

@Controller
public class GarbageController {
    @Autowired
    private FileService file;
    @Autowired
    private UserService user;
    /*申请权限功能*/
    @RequestMapping("/garbage")
    public String toGarbage(Page page, HttpSession session, HttpServletRequest req,Model mv) throws Exception {
        List<com.zhning.cloud.Model.File> list;
        PageBean pageBean = new PageBean();
        String username = (String) session.getAttribute("user_name");
        //session没有用户名说明没有登陆，让他转去主页
        if (username == null || "".equals(username)) {
            return "login";
        }
        page.setFilepath(username);
        if (page.getCurrentpage() == 0)//初值
            page.setCurrentpage(1);
        if (page.getPageSize() == 0)
            page.setPageSize(5);
        list = file.getUserFilesofgarbage(page);

        Integer isvip = (Integer) req.getAttribute("isvip");
        if (isvip == null) {  //没有上传文件之前会调用到这里的代码，上传的时候在uploadAction里会添加isvip
            try {
                isvip = user.isVip(username);
            } catch (Exception e) {
                e.printStackTrace();
            }
            req.setAttribute("isvip", isvip);
        }
        //拿到每页的数据，每个元素就是一条记录

        pageBean.setList(list);
        pageBean.setCurrentpage(page.getCurrentpage());
        pageBean.setPagesize(page.getPageSize());
        pageBean.setTotalrecord(file.countUserFilesofgarbage(username));

        mv.addAttribute("pagebean", pageBean);
        User user1 = user.findUserById(user.findUserID(username));
        mv.addAttribute("user",user1);
        return "garbage";

    }

    @RequestMapping("/deleteFile")
    public String Del(int id, HttpSession Session, HttpServletRequest req) {
        //判断该用户是否拥有此文件
        try {
            String username = file.findFilepathById(id);
            String login_user = (String) Session.getAttribute("user_name");
            String filename = file.findFilenameById(id); //查出文件名
            if (username != null && login_user.equals(username)) {
                file.deleteFileById(id); //删除数据库的该文件记录
                //从硬盘上删除文件
                String storepath = new String("C:" + File.separator + "upload" + File.separator + login_user + File.separator);
                storepath = storepath + filename;
                out.println(storepath);
                //obs
                File file = new File(storepath);
                OBSUtils obs = new OBSUtils();
                obs.deleteFile(filename);
                if (file.exists()) {
                    file.delete();

                } else {
                    req.setAttribute("globalmessage", "文件已不存在");
                    return "redirect:garbage";
                }
                return "redirect:garbage";
            } else { //不通过，可能是人为篡改数据，转发至全局消息页面
                req.setAttribute("globalmessage", "该文件可能不属于你");
                return "redirect:garbage";
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("globalmessage", "该文件可能不属于你");
            return "redirect:garbage";
        }
    }

    @RequestMapping("/huifu")
    public String download(int id, HttpSession Session, HttpServletRequest req, RedirectAttributes attributes) {
        //判断该用户是否拥有此文件
        try {
            String username = file.findFilepathById(id);
            String login_user = (String) Session.getAttribute("user_name");
            String filename = file.findFilenameById(id); //查出文件名
            if (username != null && login_user.equals(username)) {
                //移出回收站
                file.updateFilegarbage(false,user.findUserID(username),filename);
                attributes.addFlashAttribute("message","恢复成功！");

                return "redirect:garbage";
            } else { //不通过，可能是人为篡改数据，转发至全局消息页面
                req.setAttribute("globalmessage", "该文件可能不属于你");
                return "redirect:garbage";
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("globalmessage", "该文件可能不属于你");
            return "redirect:garbage";
        }

    }

}
