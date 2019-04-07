package cn.lightina.managebooks.pojo;

import lombok.Data;

// 添加图书结果的包装类
@Data
public class ProcessResult<T> {
    boolean status;
    int total;
    T data;
    String message;

    public ProcessResult(boolean status, int total, T data) {
        this.status = status;
        this.total = total;
        this.data = data;
    }

    public ProcessResult(boolean status) {
        this.status = status;
    }

    public ProcessResult(boolean status, T data) {
        this.status = status;
        this.data = data;
    }

    public ProcessResult(boolean status, String message) {
        this.status = status;
        this.message = message;
    }

    public ProcessResult(boolean status, T data, String message) {
        this.status = status;
        this.data = data;
        this.message = message;
    }
}

