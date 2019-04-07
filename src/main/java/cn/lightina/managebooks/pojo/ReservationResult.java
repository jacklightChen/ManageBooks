package cn.lightina.managebooks.pojo;

import lombok.Data;

@Data
public class ReservationResult<T> {
    boolean success;
    T data;
    String error;

    public ReservationResult(boolean success, String error) {
        this.success = success;
        this.error = error;
    }

    public ReservationResult(boolean success, T data) {

        this.success = success;
        this.data = data;
    }
}
