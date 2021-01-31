<%-- 
    Document   : modals
    Created on : Aug 31, 2020, 8:55:06 PM
    Author     : trata
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        
        
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thông Báo</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div style="width: 100%;margin-bottom: 1em;"><b>Bạn có chắc muốn xóa tất cả là 
                                
                            </b>
                            <div style="width: 100%; display: flex;">
                                <div style="width: 30%">
                                    <a href=""><img style="width: 100%;height: 150px;object-fit: contain;" 
                                                    src="" ></a>
                                </div>
                                <div style="width: 70%;">
                                    <span></span> <br>
                                    <br>
                                    <span><b></b></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <a href="ProcessDisplayCart"><button class="btn btn-secondary">Close</button></a>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
    </body>
</html>
