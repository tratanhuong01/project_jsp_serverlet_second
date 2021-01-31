package controller;

import com.sun.corba.se.spi.protocol.RequestDispatcherDefault;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAO;
import model.Product;

public class ProcessMemory extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAO dao = new DAO();
        String id1 = "";
        String idd = (String) request.getAttribute("IDProductContent");
        if (idd == null) {
            id1 = request.getParameter("IDProduct_View");
            idd = dao.getIDGProduct(id1);
        }
        else {
            idd = (String) request.getAttribute("IDProductContent");
        }
        String boNho = request.getParameter("BoNho");
        String color = request.getParameter("Color");
        Product product = (Product)dao.getProductByBoNho(idd,boNho,color);
        request.setAttribute("product-view_1", product);
        request.setAttribute("memory-product", dao.getMemoryProduct(idd));
        request.setAttribute("color-product", dao.getColorProduct(idd));
        RequestDispatcher dis = request.getRequestDispatcher("view-product.jsp");
        dis.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
