package cn.lightina.managebooks.pojo;

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

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }
}
