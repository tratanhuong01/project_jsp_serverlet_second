<%@page import="StringUtil.StringCheck"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
    <div style="width: 30%;margin: auto;">
        
        <form action="ProcessRegister" method="POST">
            <h6 style="color: red;font-weight: bold;"><%= StringCheck.Check((String) request.getAttribute("error"))%></h6>
            <div style="width: 100%;display: flex;">
                
                <div style="width: 30%">
                <label for="inputAddress">Họ</label>
                <input name="firstName" type="text" class="form-control" id="inputAddress" placeholder=""
                       value="<%= StringCheck.Check(request.getParameter("firstName"))%>">
                </div>
                <div style="width: 70%;margin-left: 2em;">
                <label for="inputAddress">Tên</label>
                <input name="lastName" type="text" class="form-control" id="inputAddress" placeholder=""
                       value="<%= StringCheck.Check(request.getParameter("lastName"))%>">
                </div>
            </div>
            <div class="form-group">
                <label for="inputAddress">Email</label>
                <input name="email" type="text" class="form-control" id="inputAddress" placeholder=""
                       value="<%= StringCheck.Check(request.getParameter("email"))%>">
            </div>
            <div class="form-group">
                <label for="inputAddress">Mật Khẩu</label>
                <input name="pass" type="password" class="form-control" id="inputAddress" placeholder=""
                       value="<%= StringCheck.Check(request.getParameter("pass"))%>">
            </div>
            <div class="form-group">
                <label for="inputAddress">Nhập Lại Mật Khẩu</label>
                <input name="pass-again" type="password" class="form-control" id="inputAddress" placeholder=""
                       value="<%= StringCheck.Check(request.getParameter("pass-again"))%>">
            </div>
            <div class="form-group">
                <label for="inputAddress">Số Điện Thọai</label>
                <input name="numberPhone" type="text" class="form-control" id="inputAddress" placeholder=""
                       value="<%= StringCheck.Check(request.getParameter("numberPhone"))%>">
            </div>
            <div class="form-group">
                <label for="inputAddress">Địa Chỉ</label>
                <input name="address" type="text" class="form-control" id="inputAddress" placeholder= ""
                       value="<%= StringCheck.Check(request.getParameter("address"))%>">
            </div>
            <button type="submit" class="btn btn-primary">Đăng Kí</button>
        </form>
            <h6>Bạn đã có tài khoản .. ? <a href="login.jsp">Click here</a> để đăng nhập .</h6>
    </div>
</body>

</html>