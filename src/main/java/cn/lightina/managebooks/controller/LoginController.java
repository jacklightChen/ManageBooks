package cn.lightina.managebooks.controller;

import cn.lightina.managebooks.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/managebooks")
public class LoginController {

    @RequestMapping(value="/login",
                    method = RequestMethod.GET)
    public String login(){
        return "login";
    }

    @RequestMapping(value="/detail",
            method = RequestMethod.GET)
    public String detail(Model model,HttpServletRequest request){
        User user=new User();
        user.setUserName("hhh");
        user.setUserId(26);
        model.addAttribute("user",user);
        request.getSession().setAttribute("user",user);
        return "detail_user";
    }
}
