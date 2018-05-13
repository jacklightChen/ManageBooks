package cn.lightina.managebooks.controller;

import cn.lightina.managebooks.pojo.User;
import cn.lightina.managebooks.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/managebooks")
public class LoginController {
    @Autowired
    UserService userService;

    @RequestMapping(value = "/login",
            method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/detail",
            method = RequestMethod.GET)
    public String detail(Model model,
                         HttpServletRequest request) {
        String userName=request.getParameter("username");
        String password=request.getParameter("password");
        System.out.println(userName+" "+password);
        User user;
        if(userName!=null&&userName.length()>=6&&userName.substring(0,6).equals("admin_")){
            user = new User(userName,password);
            User u=userService.checkManager(user);
            if(u==null) return "login";
            model.addAttribute("user", user);
            request.getSession().setAttribute("user", user);
            return "detail_admin";
        }else{
            user = new User(userName,password);
            User u=userService.checkUser(user);
            if(u==null) return "login";
            model.addAttribute("user", user);
            request.getSession().setAttribute("user", user);
            return "detail_user";
        }
    }
}
