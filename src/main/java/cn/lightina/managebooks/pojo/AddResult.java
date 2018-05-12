package cn.lightina.managebooks.pojo;
/*添加图书结果的包装类*/
public class AddResult {
    boolean success;

    public AddResult(boolean success) {
        this.success = success;
    }

    public boolean isSuccess() {

        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }
}
