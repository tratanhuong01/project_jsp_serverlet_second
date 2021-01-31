package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAO;
import javax.servlet.http.HttpSession;
import model.User;

public class ProcessViewProduct extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAO dao = new DAO();
        String id = (String) request.getParameter("IDProduct_View");
        String ids = dao.getIDGProduct(id);
        request.setAttribute("IDProductContent", ids);
        request.setAttribute("product-view_1", dao.getProductByID(id));
        request.setAttribute("memory-product", dao.getMemoryProduct(ids));
        request.setAttribute("color-product", dao.getColorProduct(ids));
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
