package cn.lightina.managebooks.enumeration;

import lombok.Getter;

/**
 * @Author jacklightChen
 * @Email 1797079433@qq.com
 * @createTime 2019/4/8
 * @proverb please find the joy in your life
 **/
@Getter
public enum ExceptionEnum {
    ADD_FAILURE(10001,"添加失败"),
    RESERVATION_FAILURE(10002,"预约失败");

    private Integer code;
    private String message;

    ExceptionEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}

