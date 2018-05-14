# ManageBooks
### 简介
一个基于SpringBoot+Thymeleaf渲染的图书管理系统<br>

### 使用技术
后端 | ... 
:---:|:---
核心框架 | spring、springboot、mybatis
连接池 | Alibaba Druid

前端 | ... 
:---:|:---
核心框架(轻量简洁) | BootStrap、Thymeleaf
### 目录结构
```
.
├── ManageBooks.iml
├── mvnw
├── mvnw.cmd
├── pom.xml
├── readme.md
├── src
│   ├── main
│   │   ├── java
│   │   │   └── cn
│   │   │       └── lightina
│   │   │           └── managebooks
│   │   │               ├── Exception
│   │   │               │   ├── AddBookListException.java
│   │   │               │   └── ReservationException.java
│   │   │               ├── ManageBooksApplication.java
│   │   │               ├── config
│   │   │               │   └── WebConfig.java
│   │   │               ├── controller
│   │   │               │   ├── LoginController.java
│   │   │               │   └── ReaderController.java
│   │   │               ├── dao
│   │   │               │   ├── BookMapper.java
│   │   │               │   └── UserMapper.java
│   │   │               ├── pojo
│   │   │               │   ├── AddResult.java
│   │   │               │   ├── Book.java
│   │   │               │   ├── BookList.java
│   │   │               │   ├── Borrow.java
│   │   │               │   ├── BorrowDetail.java
│   │   │               │   ├── Reservation.java
│   │   │               │   ├── ReservationDetail.java
│   │   │               │   ├── ReservationResult.java
│   │   │               │   └── User.java
│   │   │               └── service
│   │   │                   ├── BookService.java
│   │   │                   └── BookServiceimpl.java
│   │   └── resources
│   │       ├── Mapper
│   │       │   ├── book.xml
│   │       │   └── user.xml
│   │       ├── application.yml
│   │       ├── static
│   │       │   ├── common
│   │       │   │   └── headbar.html
│   │       │   └── lib
│   │       │       ├── css
│   │       │       │   ├── homepage.css
│   │       │       │   └── signin.css
│   │       │       ├── images
│   │       │       │   └── qc.jpg
│   │       │       └── js
│   │       │           └── check.js
│   │       └── templates
│   │           ├── admin_addbook.html
│   │           ├── admin_borrow.html
│   │           ├── admin_processreservation.html
│   │           ├── detail_admin.html
│   │           ├── detail_user.html
│   │           ├── login.html
│   │           ├── user_booklist.html
│   │           ├── user_borrow.html
│   │           └── user_reservation.html
```

主界面:
![主界面](https://github.com/jacklightChen/managebooks/blob/master/src/main/resources/static/lib/images/managebooks_intro1.png)
用户界面:
![预约界面](https://github.com/jacklightChen/managebooks/blob/master/src/main/resources/static/lib/images/managebooks_intro2.png)
![预约记录界面](https://github.com/jacklightChen/managebooks/blob/master/src/main/resources/static/lib/images/managebooks_intro3.png)
![还书界面](https://github.com/jacklightChen/managebooks/blob/master/src/main/resources/static/lib/images/managebooks_intro7.png)
管理员界面:
![添加界面](https://github.com/jacklightChen/managebooks/blob/master/src/main/resources/static/lib/images/managebooks_intro4.png)
![处理界面](https://github.com/jacklightChen/managebooks/blob/master/src/main/resources/static/lib/images/managebooks_intro5.png)
![借阅界面](https://github.com/jacklightChen/managebooks/blob/master/src/main/resources/static/lib/images/managebooks_intro6.png)