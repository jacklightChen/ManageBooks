package cn.lightina.managebooks.controller;

import cn.lightina.managebooks.pojo.*;
import cn.lightina.managebooks.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/managebooks")
public class ReaderController {
    @Autowired
    BookService bookService;

    @GetMapping(value = "/booklist")
    public String listBookList(Model model, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        model.addAttribute("user", user);
        List<BookList> list = bookService.getlist();
        model.addAttribute("list", list);
        return "user_booklist";
    }

    @PostMapping(value = "/query")
    public String listBookListById(Model model, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        model.addAttribute("user", user);
        String bname = request.getParameter("bname");
        List<BookList> list = bookService.getlistByQuery(bname);
        model.addAttribute("list", list);
        return "user_booklist";
    }

    @GetMapping(value = "/{ISBN}/booklist")
    public String listBookListById(
            Model model,
            HttpServletRequest request,
            @PathVariable(value = "ISBN") String ISBN,
            HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        model.addAttribute("user", user);
        response.setContentType("text/html;charset=utf8");
        ReservationResult<Reservation> rr;
        PrintWriter pw = null;
        Reservation r = null;
        try {
            pw = response.getWriter();
            bookService.processRes(ISBN, user);
            rr = new ReservationResult<>(true, r);
        } catch (Exception e) {
            rr = new ReservationResult<>(false, "预约失败");
        }
        if (rr.isSuccess()) {
            pw.print("<script>alert('预约成功');window.location.href='/managebooks/booklist';</script>");
        } else {
            pw.print("<script>alert('预约失败,请重新预约!');window.location.href='/managebooks/booklist';</script>");
        }
        List<BookList> list = bookService.getlist();
        model.addAttribute("list", list);
        return "user_booklist";
    }

    @GetMapping(value = "/reservation")
    public String listResListById(Model model,
                                  HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        model.addAttribute("user", user);
        List<ReservationDetail> list = bookService.getResById(user);
        model.addAttribute("list", list);
        return "user_reservation";
    }

    @GetMapping(value = "/borrow")
    public String listBorListById(Model model,
                                  HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        model.addAttribute("user", user);
        List<BorrowDetail> list = bookService.getBorInfo(user);
        model.addAttribute("list", list);
        return "user_borrow";
    }

    @GetMapping(value = "{borrowId}/return")
    public String returnBookById(
            Model model,
            HttpServletRequest request,
            @PathVariable(value = "borrowId") Integer borrowId) {
        User user = (User) request.getSession().getAttribute("user");
        model.addAttribute("user", user);
        bookService.returnBookById(borrowId);
        List<BorrowDetail> list = bookService.getBorInfo(user);
        model.addAttribute("list", list);
        return "user_borrow";
    }

    // admin
    @GetMapping(value = "/admin/books")
    public String showBook(Model model, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        model.addAttribute("user", user);
        List<BookList> list = bookService.getlist();
        model.addAttribute("list", list);
        return "admin_addbook";
    }

    // 添加图书
    @RequestMapping(value = "/admin/books",
            method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public ProcessResult addbook(HttpServletRequest request,
                                 @RequestBody BookList bookList) {
        User user = (User) request.getSession().getAttribute("user");
        ProcessResult ar;
        bookList.setOperator(user.getUserId());
        bookService.addBookList(bookList,0);
        ar = new ProcessResult(true);
        return ar;
    }

    @GetMapping(value = "/admin/reservation")
    public String processRes(
            Model model,
            HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        model.addAttribute("user", user);
        List<ReservationDetail> list = bookService.getResList();
        model.addAttribute("list", list);
        return "admin_processreservation";
    }

    @GetMapping(
            value = "/admin/{reservationId}/borrow")
    public String addBorrow(
            Model model,
            HttpServletRequest request,
            @PathVariable(value = "reservationId") Integer reservationId) {
        User user = (User) request.getSession().getAttribute("user");
        model.addAttribute("user", user);
        bookService.insertBorrow(reservationId,user.getUserId());
        List<ReservationDetail> list = bookService.getResList();
        model.addAttribute("list", list);
        return "admin_processreservation";
    }

    // 查看借阅情况
    @GetMapping(
            value = "/admin/borrow")
    public String showBorrow(
            Model model,
            HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        model.addAttribute("user", user);
        List<BorrowDetail> list = bookService.getBorList();
        model.addAttribute("list", list);
        return "admin_borrow";
    }

    // 查看借阅情况
    @GetMapping(
            value = "/admin/delete")
    @ResponseBody
    public ProcessResult delBookList(
            Model model,
            HttpServletRequest request,
            @RequestBody BookList bookList) {
        User user = (User) request.getSession().getAttribute("user");
        ProcessResult pr;
        try{
            bookService.deleteBookList(bookList);
            pr=new ProcessResult(true);
        }catch (Exception e){
            pr=new ProcessResult(false);
        }
        return pr;
    }
}
