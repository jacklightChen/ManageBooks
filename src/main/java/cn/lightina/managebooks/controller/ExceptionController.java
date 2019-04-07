package cn.lightina.managebooks.controller;

import cn.lightina.managebooks.exception.ServiceException;
import cn.lightina.managebooks.pojo.ProcessResult;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author jacklightChen
 * @Email 1797079433@qq.com
 * @createTime 2019/4/8
 * @proverb please find the joy in your life
 **/
@RestControllerAdvice
public class ExceptionController {
    // 捕捉自定义Exception
    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(ServiceException.class)
    public ProcessResult handle401(ServiceException e) {
        return new ProcessResult(false, e.getMessage());
    }

    // 捕捉其他所有异常
    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ProcessResult globalException(HttpServletRequest request, Throwable ex) {
        return new ProcessResult(false, ex.getMessage());
    }

    private HttpStatus getStatus(HttpServletRequest request) {
        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
        if (statusCode == null) {
            return HttpStatus.INTERNAL_SERVER_ERROR;
        }
        return HttpStatus.valueOf(statusCode);
    }
}