<%@page import="StringUtil.StringCheck"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>

    <div style="width: 30%;margin: auto;">
        <h6 style="color: red;font-weight: bold;"><%= StringCheck.Check((String) request.getAttribute("error-login"))%></h6>
        <form action="ProcessLogin" method="POST">
            <div class="form-group">
              <label for="exampleInputEmail1">Email</label>
              <input name="email-login" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">Mật Khẩu</label>
              <input name="pass-login" type="password" class="form-control" id="exampleInputPassword1">
            </div>
            <div class="form-group form-check">
              <input type="checkbox" class="form-check-input" id="exampleCheck1">
              <label class="form-check-label" for="exampleCheck1">Nhớ mật khẩu</label>
            </div>
            <button type="submit" class="btn btn-primary">Đăng Nhập</button>
          </form>
        <h6>Bạn chưa có tài khoản .. ? <a href="register.jsp">Click here</a> để tạo tài khoản .</h6>
    </div>
</body>

</html>