
<%@page import="model.DAO"%>
<%@page import="model.Color"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="StringUtil.StringCheck"%>
<%@page import="model.Product"%>
<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang Chủ</title>
        <link rel="stylesheet" href="css/view-product.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" />
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>

    <body>
        <div id="main">
            <%@include file="/WEB-INF/header.jspf" %>
            <% String string = StringCheck.Check(request.getParameter("Edit")); %>
            <% if(string.equals("True")) { %>
            <div id="view">
                <% Product product = (Product) request.getAttribute("product-view_1");%>
                <% DAO dao = new DAO(); %>
                <div style="width: 100%;">
                    <h3><%= product.getNameProduct()%>&nbsp;<%= product.getMemory() %></h3>
                    <hr>
                </div>
                <div id="detail-product">
                    <div id="left">
                        <div class="img-left">
                            <a href=""><img style="width: 100%;height: 400px;object-fit: contain;"
                                            src="<%= product.getImageProduct()%>"
                                            alt=""></a>
                        </div>
                        <div style="width: 100%;">
                            <span style="font-size: 14px;"><%= product.getMoTa_1()%></span>
                            <br>
                            <br>
                            <span style="font-size: 14px;"><%= product.getMoTa_2()%></span>
                        </div>
                    </div>
                    <div id="center">
                        <div style="width: 100%;margin-bottom: 3em;">
                            <% float cost = (float) product.getCostProduct() - (float) ((float) product.getCostProduct() * ((float) product.getCostSale() / 100));
                            %>
                            <span style="font-size: 20px;font-weight: bold;color: red;"><%= StringCheck.convertMoney((int) cost)%></span>
                            &nbsp;&nbsp;&nbsp;
                            <span style="font-size: 15px;font-weight: normal;"><strike><%= StringCheck.convertMoney(product.getCostProduct())%></strike></span>
                        </div>
                        <div style="width: 100%;margin-bottom: 3em;">
                            <input type="number" name="numbers">
                        </div>
                        <%  
                            ArrayList list = (ArrayList) request.getAttribute("memory-product"); %>
                        <% List<Color> listc = (List<Color>) request.getAttribute("color-product"); %>
                        <div style="width: 100%;">
                            <ul class="option-buy">
                                <%for (int i = 0; i < listc.size(); i++) {%>
                                <a href="ProcessMemory?IDProduct_View=<%= product.getIdProduct() %>&BoNho=<%= 
                                    request.getParameter("BoNho") == null ? dao.getMemoryProduct(product.getIdProduct()).get(0).toString()
                                            : request.getParameter("BoNho") %>&Color=<%= listc.get(i).getIdColor() %>">
                                    <li style="width: 40px;height: 40px;padding: 10px; border: 
                                        3px solid #ccc; border-radius: 50%;
                                        background-color: <%= listc.get(i).getCodeColor() %>"></li></a>
                                <% }%>
                                
                            </ul>
                                <b style="margin-left: 1em;"><%= StringCheck.Check(dao.getColorByIDColor(request.getParameter("Color"))) %></b>
                            <br>
                            
                            <br>
                            
                        </div>
                        <div style="width: 100%;">
                            <h6 style="margin-bottom: 8px !important;">Bạn có <span><%= list.size()%></span> sự lựa chọn</h6>
                            <ul class="option-buy">
                                <%for (int i = 0; i < list.size(); i++) {%>
                                <a href="ProcessMemory?IDProduct_View=<%= 
                                    product.getIdProduct()
                                %>&BoNho=<%= list.get(i)%>&Color=<%=
                                    request.getParameter("Color") == null ? dao.getColorProduct(product.getIdGProduct()).get(0).getIdColor()
                                            : request.getParameter("Color") %>">
                                    <li style="width: 70px;height: 50px;padding: 10px; border: 3px solid #ccc; "><%= list.get(i)%></li></a>
                                        <% }%>
                            </ul>
                        </div>

                        <div style="width: 100%;margin: 1em 0px;">
                            <a style="border-radius: 30px;padding: 8px 13px; background-color: tomato;color: wheat;"
                               href="">Khuyến mãi ưu đãi</a>
                        </div>
                        <div style="width: 100%;margin: 1em 0px;">
                            <h6>Có <span>4</span> ưu đãi phụ kiện cho sản phẩm này</h6>
                            <br>
                            <p>
                                <i style="color: red;font-size: 12px;" class="fas fa-circle"></i>
                                Sim 4G Data Itelecom May77 giá 165.000đ (Giá lẻ 199.000đ)
                            </p>
                            <p>
                                <i style="color: red;font-size: 12px" class="fas fa-circle"></i>
                                Sim 4G Data Itelecom May77 giá 165.000đ (Giá lẻ 199.000đ)
                            </p>
                            <p>
                                <i style="color: red;font-size: 12px" class="fas fa-circle"></i>
                                Sim 4G Data Itelecom May77 giá 165.000đ (Giá lẻ 199.000đ)
                            </p>
                            <p>
                                <i style="color: red;font-size: 12px" class="fas fa-circle"></i>
                                Sim 4G Data Itelecom May77 giá 165.000đ (Giá lẻ 199.000đ)
                            </p>
                            <br>
                        </div>
                                       
                        <div style="width: 100%;">
                            <form action="" method="post">
                                <button style="width: 100%;margin-bottom: 1em;height: 60px;" type="submit"
                                        class="btn btn-primary">Đặt Hàng
                                    Trước</button><br>
                            </form>
                            <div style="width: 100%;display: flex;">
                                <form style="width: 50%;" action="" method="post">
                                    <a href="ProcessBuyProduct?IDProduct_View=<%= product.getIdProduct() %>" style="width: 99%;height: 60px;" class="btn btn-success">Mua
                                        Hàng</a>
                                </form>
                                <form style="width: 50%;" action="" method="post">
                                    <button style="width: 99%;height: 60px;" type="submit" class="btn btn-warning">Trả
                                        Góp</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div id="right">
                        <div style="width: 100%;padding: 10px;display: flex;">
                            <div style="width: 23%;">
                                <i style="font-size: 40px;color: tomato;" class="fas fa-gift"></i>
                            </div>
                            <div style="width: 77%;">
                                <b>Bộ Sản Phẩm </b><span> Full phụ kiện máy , tai nghe , cáp sạc, củ sạc , hộp</span>
                            </div>
                        </div>
                        <div style="width: 100%;padding: 10px;display: flex;">
                            <div style="width: 23%;">
                                <i style="font-size: 40px;color: tomato;" class="fas fa-shield-alt"></i>
                            </div>
                            <div style="width: 77%;">
                                <span>Bảo hành pin 06 tháng 1 đổi 1 Miễn Phí.</span><br><br>
                                <span>Bảo hành mặc định iPhone 06 tháng. 1 Đổi 1 trong vòng 33 ngày. Dùng thử 7 ngày Miễn
                                    Phí.</span><br><br>
                                <span>Bảo hành 1 đổi 1, bảo hành rơi vỡ, rớt nước trong 12 tháng (Xem chi tiết)</span>
                            </div>
                        </div>
                        <div style="width: 100%;padding: 10px;display: flex;">
                            <div style="width: 23%;">
                                <i style="font-size: 40px;color: tomato;" class="fas fa-dollar-sign"></i>
                            </div>
                            <div style="width: 77%;">
                                <span>Trả góp 0% qua thẻ tín dụng (Không trả trước, trả hàng tháng chỉ 2.365.000 ₫) hoặc qua
                                    Paylater (Trả trước 4.257.000 ₫, trả hàng tháng chỉ 3.311.000 ₫).</span>
                                <br><br>
                                <span>Hoặc Trả góp có lãi suất với trả trước 1.419.000 ₫, trả hàng tháng 2.147.657 ₫ qua nhà
                                    tài chính Home Credit, FE Credit, HD Saison (chỉ cần CMND + GPLX)</span>
                            </div>
                        </div>
                        <div style="width: 100%;padding: 10px;display: flex;">
                            <div style="width: 23%;">
                                <i style="font-size: 40px;color: tomato;" class="fas fa-motorcycle"></i>
                            </div>
                            <div style="width: 77%;">
                                <b>Miễn Phí </b><span> vận chuyển, giao hàng tận nơi - Nội thành giao nhanh trong 1
                                    giờ.</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%}
             else { %>
            <div id="view">
                <% Product product = (Product) request.getAttribute("product-view_1");%>
                <% DAO dao = new DAO(); %>
                <div style="width: 100%;">
                    <h3><%= product.getNameProduct()%>&nbsp;<%= product.getMemory() %></h3>
                    <hr>
                </div>
                <div id="detail-product">
                    <div id="left">
                        <div class="img-left">
                            <a href=""><img style="width: 100%;height: 400px;object-fit: contain;"
                                            src="<%= product.getImageProduct()%>"
                                            alt=""></a>
                        </div>
                        <div style="width: 100%;">
                            <span style="font-size: 14px;"><%= product.getMoTa_1()%></span>
                            <br>
                            <br>
                            <span style="font-size: 14px;"><%= product.getMoTa_2()%></span>
                        </div>
                    </div>
                    <div id="center">
                        <div style="width: 100%;margin-bottom: 3em;">
                            <% float cost = (float) product.getCostProduct() - (float) ((float) product.getCostProduct() * ((float) product.getCostSale() / 100));
                            %>
                            <span style="font-size: 20px;font-weight: bold;color: red;"><%= StringCheck.convertMoney((int) cost)%></span>
                            &nbsp;&nbsp;&nbsp;
                            <span style="font-size: 15px;font-weight: normal;"><strike><%= StringCheck.convertMoney(product.getCostProduct())%></strike></span>
                        </div>
                        <%  
                            ArrayList list = (ArrayList) request.getAttribute("memory-product"); %>
                        <% List<Color> listc = (List<Color>) request.getAttribute("color-product"); %>
                        <div style="width: 100%;">
                            <ul class="option-buy">
                                <%for (int i = 0; i < listc.size(); i++) {%>
                                <a href="ProcessMemory?IDProduct_View=<%= product.getIdProduct() %>&BoNho=<%= 
                                    request.getParameter("BoNho") == null ? dao.getMemoryProduct(product.getIdProduct()).get(0).toString()
                                            : request.getParameter("BoNho") %>&Color=<%= listc.get(i).getIdColor() %>">
                                    <li style="width: 40px;height: 40px;padding: 10px; border: 
                                        3px solid #ccc; border-radius: 50%;
                                        background-color: <%= listc.get(i).getCodeColor() %>"></li></a>
                                <% }%>
                                
                            </ul>
                                <b style="margin-left: 1em;"><%= StringCheck.Check(dao.getColorByIDColor(request.getParameter("Color"))) %></b>
                            <br>
                            
                            <br>
                            
                        </div>
                        <div style="width: 100%;">
                            <h6 style="margin-bottom: 8px !important;">Bạn có <span><%= list.size()%></span> sự lựa chọn</h6>
                            <ul class="option-buy">
                                <%for (int i = 0; i < list.size(); i++) {%>
                                <a href="ProcessMemory?IDProduct_View=<%= 
                                    product.getIdProduct()
                                %>&BoNho=<%= list.get(i)%>&Color=<%=
                                    request.getParameter("Color") == null ? dao.getColorProduct(product.getIdGProduct()).get(0).getIdColor()
                                            : request.getParameter("Color") %>">
                                    <li style="width: 70px;height: 50px;padding: 10px; border: 3px solid #ccc; "><%= list.get(i)%></li></a>
                                        <% }%>
                            </ul>
                        </div>

                        <div style="width: 100%;margin: 1em 0px;">
                            <a style="border-radius: 30px;padding: 8px 13px; background-color: tomato;color: wheat;"
                               href="">Khuyến mãi ưu đãi</a>
                        </div>
                        <div style="width: 100%;margin: 1em 0px;">
                            <h6>Có <span>4</span> ưu đãi phụ kiện cho sản phẩm này</h6>
                            <br>
                            <p>
                                <i style="color: red;font-size: 12px;" class="fas fa-circle"></i>
                                Sim 4G Data Itelecom May77 giá 165.000đ (Giá lẻ 199.000đ)
                            </p>
                            <p>
                                <i style="color: red;font-size: 12px" class="fas fa-circle"></i>
                                Sim 4G Data Itelecom May77 giá 165.000đ (Giá lẻ 199.000đ)
                            </p>
                            <p>
                                <i style="color: red;font-size: 12px" class="fas fa-circle"></i>
                                Sim 4G Data Itelecom May77 giá 165.000đ (Giá lẻ 199.000đ)
                            </p>
                            <p>
                                <i style="color: red;font-size: 12px" class="fas fa-circle"></i>
                                Sim 4G Data Itelecom May77 giá 165.000đ (Giá lẻ 199.000đ)
                            </p>
                            <br>
                        </div>
                                       
                        <div style="width: 100%;">
                            <form action="" method="post">
                                <button style="width: 100%;margin-bottom: 1em;height: 60px;" type="submit"
                                        class="btn btn-primary">Đặt Hàng
                                    Trước</button><br>
                            </form>
                            <div style="width: 100%;display: flex;">
                                <form style="width: 50%;" action="" method="post">
                                    <a href="ProcessBuyProduct?IDProduct_View=<%= product.getIdProduct() %>" style="width: 99%;height: 60px;" class="btn btn-success">Mua
                                        Hàng</a>
                                </form>
                                <form style="width: 50%;" action="" method="post">
                                    <button style="width: 99%;height: 60px;" type="submit" class="btn btn-warning">Trả
                                        Góp</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div id="right">
                        <div style="width: 100%;padding: 10px;display: flex;">
                            <div style="width: 23%;">
                                <i style="font-size: 40px;color: tomato;" class="fas fa-gift"></i>
                            </div>
                            <div style="width: 77%;">
                                <b>Bộ Sản Phẩm </b><span> Full phụ kiện máy , tai nghe , cáp sạc, củ sạc , hộp</span>
                            </div>
                        </div>
                        <div style="width: 100%;padding: 10px;display: flex;">
                            <div style="width: 23%;">
                                <i style="font-size: 40px;color: tomato;" class="fas fa-shield-alt"></i>
                            </div>
                            <div style="width: 77%;">
                                <span>Bảo hành pin 06 tháng 1 đổi 1 Miễn Phí.</span><br><br>
                                <span>Bảo hành mặc định iPhone 06 tháng. 1 Đổi 1 trong vòng 33 ngày. Dùng thử 7 ngày Miễn
                                    Phí.</span><br><br>
                                <span>Bảo hành 1 đổi 1, bảo hành rơi vỡ, rớt nước trong 12 tháng (Xem chi tiết)</span>
                            </div>
                        </div>
                        <div style="width: 100%;padding: 10px;display: flex;">
                            <div style="width: 23%;">
                                <i style="font-size: 40px;color: tomato;" class="fas fa-dollar-sign"></i>
                            </div>
                            <div style="width: 77%;">
                                <span>Trả góp 0% qua thẻ tín dụng (Không trả trước, trả hàng tháng chỉ 2.365.000 ₫) hoặc qua
                                    Paylater (Trả trước 4.257.000 ₫, trả hàng tháng chỉ 3.311.000 ₫).</span>
                                <br><br>
                                <span>Hoặc Trả góp có lãi suất với trả trước 1.419.000 ₫, trả hàng tháng 2.147.657 ₫ qua nhà
                                    tài chính Home Credit, FE Credit, HD Saison (chỉ cần CMND + GPLX)</span>
                            </div>
                        </div>
                        <div style="width: 100%;padding: 10px;display: flex;">
                            <div style="width: 23%;">
                                <i style="font-size: 40px;color: tomato;" class="fas fa-motorcycle"></i>
                            </div>
                            <div style="width: 77%;">
                                <b>Miễn Phí </b><span> vận chuyển, giao hàng tận nơi - Nội thành giao nhanh trong 1
                                    giờ.</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%}%>
            <hr>
            <div id="description">
                <div class="des-left">

                </div>
                <div class="des-right">

                </div>
            </div>
        </div>
    </body>

</html>