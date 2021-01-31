package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAO;
import model.Product;

public class ProcessColor extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAO dao = new DAO();
        String id1 = "";
        String idd = (String)request.getAttribute("IDProductContent");
        if (idd == null) {
            id1 = request.getParameter("IDProduct_View");
            idd = dao.getIDGProduct(id1);
        }
        else {
            idd = (String)request.getAttribute("IDProductContent");
        }
        Product product = null;
        String boNho = request.getParameter("BoNho");
        String color = request.getParameter("Color");
        request.setAttribute("product-view_1", product);
        request.setAttribute("product-view_1", dao.getProductByBoNho(idd,boNho,color));
        request.setAttribute("memory-product", dao.getMemoryProduct(idd));
        request.setAttribute("color-product", dao.getColorProduct(idd));
        RequestDispatcher dis = request.getRequestDispatcher("view-product.jsp");
        dis.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
