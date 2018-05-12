var checkadd=[false,false,false,false];

//校验成功函数
function success(Obj,counter,check,offset) {
    Obj.parent().parent().removeClass('has-error').addClass('has-success');
    $('.tips').eq(counter+offset).hide();
    $('.glyphicon-ok').eq(counter+offset).show();
    $('.glyphicon-remove').eq(counter+offset).hide();
    check[counter] = true;

}

// 校验失败函数
function fail(Obj,counter,msg,check,offset) {
    Obj.parent().parent().removeClass('has-success').addClass('has-error');
    $('.glyphicon-remove').eq(counter+offset).show();
    $('.glyphicon-ok').eq(counter+offset).hide();
    $('.tips').eq(counter+offset).text(msg).show();
    check[counter] = false;
}

//添加图书逻辑

//ISBN
var regISBN = /^[0-9]{13}$/;
$('#add').find('input').eq(0).change(function() {
    if (regISBN.test($(this).val())) {
        success($(this), 0,checkadd,0);
    } else {
        fail($(this), 0, 'ISBN只能为13位数字',checkadd,0);
    }
});
//bname
$('#add').find('input').eq(1).change(function() {
    if ($(this).val().length < 3) {
        fail($(this), 1, '书名太短，不能少于3个字符',checkadd,0);
    } else {
            success($(this),1,checkadd,0);
    }
});
//publisher
$('#add').find('input').eq(2).change(function() {
    if ($(this).val().length < 3) {
        fail($(this), 1, '出版社名太短，不能少于3个字符',checkadd,0);
    } else {
        success($(this),1,checkadd,0);
    }
});
//writer
$('#add').find('input').eq(3).change(function() {
    if ($(this).val().length < 1) {
        fail($(this), 1, '姓名太短',checkadd,0);
    } else {
        success($(this),1,checkadd,0);
    }
});
//ptime
var regtime=/^[0-9]{4}[\-]{1}[0-9]{2}[\-]{1}[0-9]{2}$/;
$('#add').find('input').eq(4).change(function() {
    if (regtime.test($(this).val())) {
        success($(this), 0,checkadd,0);
    } else {
        fail($(this), 0, '日期应形如XXXX-XX-XX',checkadd,0);
    }
});
//num
var regnum=/^[0-9]*$/;
$('#add').find('input').eq(5).change(function() {
    if (regnum.test($(this).val())) {
        success($(this), 0,checkadd,0);
    } else {
        fail($(this), 0, '请输入数字',checkadd,0);
    }
});