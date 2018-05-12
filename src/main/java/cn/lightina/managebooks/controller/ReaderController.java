package cn.lightina.managebooks.controller;

import cn.lightina.managebooks.pojo.*;
import cn.lightina.managebooks.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/managebooks")
public class ReaderController {
    @Autowired
    BookService bookService;

    @RequestMapping(value="/reservation",
            method = RequestMethod.GET)
    public String listBookList(Model model,HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("user");
        model.addAttribute("user",user);
        List<BookList>list=bookService.getlist();
        model.addAttribute("list",list);
        return "user_reservation";
    }

    @RequestMapping(value="/query",
            method = RequestMethod.POST)
    public String listBookListById(Model model,HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("user");
        model.addAttribute("user",user);
        String bname=request.getParameter("bname");
        List<BookList>list=bookService.getlistByQuery(bname);
        model.addAttribute("list",list);
        return "user_reservation";
    }

    @RequestMapping(value="/{ISBN}/reservation",
            method = RequestMethod.GET)
    public String listBookListById(Model model,
                                   HttpServletRequest request,
                                   @PathVariable(value="ISBN")String ISBN,
                                   HttpServletResponse response){
        User user=(User)request.getSession().getAttribute("user");
        model.addAttribute("user",user);
        response.setContentType("text/html;charset=utf8");
        ReservationResult<Reservation> rr=null;
        PrintWriter pw=null;
        Reservation r=null;
        try {
            pw=response.getWriter();
            r = bookService.processRes(ISBN,user);
            rr=new ReservationResult<>(true,r);
        }catch (Exception e){
            rr=new ReservationResult<>(false,"预约失败");
        }
        if(rr.isSuccess()){
            pw.print("<script>alert('预约成功,您的预约号为: "+r.getReservationId()+"');window.location.href='/managebooks/reservation';</script>");
        }else{
            pw.print("<script>alert('预约失败,请重新预约!');window.location.href='/managebooks/reservation';</script>");
        }
        List<BookList>list=bookService.getlist();
        model.addAttribute("list",list);
        return "user_reservation";
    }



}
