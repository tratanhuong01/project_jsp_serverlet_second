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
        <link rel="stylesheet" href="css/cart.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    </head>
    <body>

        <% List<Product> list = (List<Product>) request.getAttribute("productcart-user"); %>
        <% DAO dao = new DAO();
        %>
        <div id="main">
            <%@include file="/WEB-INF/header.jspf" %>
            <%
                String iddd = StringCheck.Check(request.getParameter("IDProduct"));
                Product product = dao.getProductByID(iddd);
                String ch = StringCheck.Check(request.getParameter("Delete"));
                if (product != null & ch.equals("True")) {%>
            <div class="modal fade in" id="myModal" role="dialog" style="display: block;">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button onclick="closeModal()" type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Thông Tin Sản Phẩm</h4>
                        </div>
                        <div class="modal-body">
                            <div style="width: 100%">
                                <b>Có phải bạn có muốn xóa &nbsp;<%= dao.countDISTINCT(product.getIdProduct(), user.getId())%>&nbsp; sản phẩm này </b>
                            </div>
                            <div style="width: 100%;display: flex;">
                                <div style="width: 30%;">
                                    <img src="<%= product.getImageProduct()%>">
                                </div>
                                <div style="width: 70%;">
                                    <div>
                                        <b><%= product.getNameProduct() + " "
                                                + product.getMemory() + " "
                                                + dao.getColorByIDColor(product.getIdColor())%></b>
                                        <br>
                                        <br>
                                        <b><%= StringCheck.convertMoney(
                                                dao.countDISTINCT(product.getIdProduct(), user.getId()) * product.getCostProduct()
                                        )%></b>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a href="ProcessDisplayCart" class="btn btn-default" data-dismiss="modal">Close</a>
                        </div>
                    </div>

                </div>
            </div>
            <% } else {%>
            <div class="modal fade in" id="myModal" role="dialog" style="display: none;">
                
            </div>
            <% } %>
            <div style="width: 78%;margin: auto;">
                <div class="container" id="fullcoaksas"> 
                    <table id="cart" class="table table-hover table-condensed"> 
                        <thead> 
                            <tr> 
                                <th style="width:50%">Tên sản phẩm</th> 
                                <th style="width:10%">Giá</th> 
                                <th style="width:8%">Số lượng</th> 
                                <th style="width:22%" class="text-center">Thành tiền</th> 
                                <th style="width:10%"> </th> 
                            </tr> 
                        </thead> 

                        <% for (int i = 0; i < list.size(); i++) { %>

                        <% int tongTien = dao.countDISTINCT(list.get(i).getIdProduct(), user.getId()) * list.get(i).getCostProduct();%>

                </div>
                <tbody>

                    <tr> 
                        <td data-th="Product"> 
                            <div class="row"> 
                                <div class="col-sm-2 hidden-xs"><img src="<%= list.get(i).getImageProduct()%>" alt="" class="img-responsive" width="100">
                                </div> 
                                <div class="col-sm-10"> 
                                    <h4 class="nomargin"><%= list.get(i).getNameProduct() + " "
                                            + list.get(i).getMemory() + " "
                                            + dao.getColorByIDColor(list.get(i).getIdColor())%></h4> 
                                    <p><%= list.get(i).getMoTa_1()%></p> 
                                </div> 
                            </div> 
                        </td> 

                        <td data-th="Price"><%= StringCheck.convertMoney(tongTien)%></td> 
                        <td data-th="Quantity"><input class="form-control text-center" value="<%=String.valueOf(dao.countDISTINCT(list.get(i).getIdProduct(), user.getId()))%>" type="number">
                        </td> 
                        <td data-th="Subtotal" class="text-center"><%= StringCheck.convertMoney(tongTien)%></td> 
                        <td class="actions" data-th="">
                            <a href="ProcessViewProduct?IDProduct_View=<%= list.get(i).getIdProduct()%>&BoNho=<%=list.get(i).getMemory()%>&Color=<%=list.get(i).getIdColor()%>&Edit=True" class="btn btn-info btn-sm"><i class="fa fa-edit"></i>
                            </a> 
                            <a href="ProcessDisplayCart?IDProduct=<%= list.get(i).getIdProduct()%>&Delete=True" class="btn btn-danger btn-sm"><i class="fa fa-trash-alt"></i>
                            </a>
                        </td> 
                    </tr> 

                </tbody>

                <% }%>
                <tfoot> 
                    <tr class="visible-xs">   
                    </tr> 
                    <tr> 
                        <td><a href="" class="btn btn-warning"><i class="fa fa-angle-left"></i> Tiếp tục mua hàng</a>
                        </td> 
                        <td colspan="2" class="hidden-xs text-center"><strong>Tổng tiền 500.000 đ</strong> </td> 
                        <td colspan="2" class="hidden-xs text-center"><a href="" id="btnThanhToan" class="btn btn-success btn-block">Thanh toán <i class="fa fa-angle-right"></i></a>
                        </td> 
                    </tr> 
                </tfoot> 
                </table>
            </div>
        </div>
    </div>

</body>

</html>