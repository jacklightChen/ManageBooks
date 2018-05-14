package cn.lightina.managebooks.controller;

import cn.lightina.managebooks.pojo.ProcessResult;
import cn.lightina.managebooks.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/managebooks")
public class emailController {
    @Autowired
    MailService mailService;

    @RequestMapping(value = "/{validation}/email",
            method = RequestMethod.GET)
    public ProcessResult login(@PathVariable(value = "validation")Integer val){
        ProcessResult pr;
        if(val==null)return new ProcessResult(false);
        if(!val.equals(2018))return new ProcessResult(false);
        try {
            mailService.processReminder();
            pr=new ProcessResult(true);
        }catch (Exception e){
            pr=new ProcessResult(false);
        }
        return pr;
    }

}
