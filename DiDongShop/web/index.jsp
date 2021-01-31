<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="model.DAO"%>
<%@page import="StringUtil.StringCheck"%>
<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang Chủ</title>
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>

    <body>
        <div id="main">
            <%@include file="/WEB-INF/header.jspf" %>
            <div id="content"> 
                <h3>Điện Thoại Nổi Bật</h3>
                <div id="product">
                    <% DAO dao = new DAO();
                    List<Product> list = (List < Product >)dao.loadProductByPage(0, 8);
                    if (request.getParameter("pages") == null) {
                        list = dao.loadProductByPage(0, 8);
                    }
                    else {
                        int pages = Integer.parseInt(request.getParameter("pages"));
                        int nums = -1;
                        if (pages == 0) {
                            nums = 0;
                        }
                        else {
                            nums = pages * 8; 
                        }
                        list = dao.loadProductByPage(pages, 8);
                    }
                    
                        for (int i = 0; i < list.size(); i++) {
                    %>

                    <div class="info-product">
                        <div class="img-product">
                            <a href=""><img style="width: 100%;height: 250px;object-fit: contain;" 
                                            src="<%= list.get(i).getImageProduct()%>" alt=""></a>
                            <div class="buy">
                                <form action="" method="post">
                                    <button style="width: 90%;margin: 1em 5%;" type="submit" class="btn btn-success">Thêm </button>
                                </form>
                            </div>
                        </div>
                        <% request.setAttribute("idGProduct_Get", list.get(i).getIdGProduct());%>
                        <div style="width: 100%;padding: 8px;text-align: center;">
                           <a href="ProcessViewProduct?IDProduct_View=<%= list.get(i).getIdProduct()%>&BoNho=<%=list.get(i).getMemory()
                              %>&Color=<%=list.get(i).getIdColor()%>">
                                <%= list.get(i).getNameProduct()%>&nbsp;&nbsp;<%= list.get(i).getMemory()%>
                        </div>
                        <div style="width: 100%;padding: 8px;text-align: center;">

                            <a style="color: tomato;font-weight: bold;font-size: 17px;text-decoration: none;"
                               href=""><%= StringCheck.convertMoney(list.get(i).getCostProduct())%></a>
                        </div>

                    </div>
                    <% }%>
                    <ul class="pagination" style="width: 50%;margin: auto;justify-content: center;">
                        
                        <% int numProduct = dao.countNumProduct(); 
                        int numProduct1 = numProduct/8; %>
                        <li class="page-item"><a class="page-link" href="#">Trước</a></li>
                        <% if (numProduct % 8 == 0) {
                            for (int i = 0; i < numProduct1 ; i++) { %>
                        <li class="page-item"><a class="page-link" href="ProcessPage?pages=<%= String.valueOf(i) %>"><%= String.valueOf(i) %></a></li>
                        <% }
                            }
                        else {
                        %>
                        <% for (int  i = 0; i <= numProduct1 ; i++) { %>
                        <li class="page-item"><a class="page-link" href="ProcessPage?pages=<%= String.valueOf(i) %>"><%= String.valueOf(i) %></a></li>
                        <%}
                        }%>
                        <li class="page-item"><a class="page-link" href="#">Sau</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </body>

</html>