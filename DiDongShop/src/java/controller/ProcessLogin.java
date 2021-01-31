package controller;

import com.sun.corba.se.spi.protocol.RequestDispatcherDefault;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAO;
import model.User;

public class ProcessLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email-login");
        String pass = request.getParameter("pass-login");
        DAO dao = new DAO();
        if (!dao.Login(email,pass)) {
            request.setAttribute("error-login", "Sai tên đăng nhập hoặc mật khẩu !!");
            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
            dis.forward(request, response);
            
        }
        else if (email.equals("") || pass.equals("")) {
            request.setAttribute("error-login", "Tên đăng nhập hoặc mật khẩu không được trống !!");
            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
            dis.forward(request, response);
        }
        else {
            User user = dao.getUserByEmail(email);
            session.setAttribute("Users",user);
            session.setAttribute("numberAmount", dao.CountProductCart(user.getId()));
            RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
            dis.forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
