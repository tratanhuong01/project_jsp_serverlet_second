package controller;

import StringUtil.StringCheck;
import com.sun.corba.se.spi.protocol.RequestDispatcherDefault;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAO;

public class ProcessRegister extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String pass_again = request.getParameter("pass-again");
        String numPhone = request.getParameter("numberPhone");
        String address = request.getParameter("address");
        
        if (email.equals("") && pass.equals("")
            && pass_again.equals("") && numPhone.equals("") && address.equals("")) {
            request.setAttribute("error", "Vui lòng nhập dữ liệu cho các ô vào !!");
            RequestDispatcher dis = request.getRequestDispatcher("register.jsp");
            dis.forward(request, response);
        }
        else if (!pass.equals(pass_again)) {
            RequestDispatcher dis = request.getRequestDispatcher("register.jsp");
            dis.forward(request, response);
            request.setAttribute("error", "Mật khẩu phải giống !!");
        }
        else if (StringCheck.kiemTra(firstName) == false) {
            RequestDispatcher dis = request.getRequestDispatcher("register.jsp");
            dis.forward(request, response);
            request.setAttribute("error", "Giá trị nhập vào sai định dạng !!");
        }
        else if (StringCheck.kiemTra(lastName) == false) {
            RequestDispatcher dis = request.getRequestDispatcher("register.jsp");
            dis.forward(request, response);
            request.setAttribute("error", "Giá trị nhập vào sai định dạng !!");
        }
        else if (StringCheck.checkEmail(email) == false) {
            RequestDispatcher dis = request.getRequestDispatcher("register.jsp");
            dis.forward(request, response);
            request.setAttribute("error", "Giá trị nhập vào sai định dạng !!");
        }
        else if (StringCheck.checkNumberPhone(numPhone) == false) {
            RequestDispatcher dis = request.getRequestDispatcher("register.jsp");
            dis.forward(request, response);
            request.setAttribute("error", "Giá trị nhập vào sai định dạng !!");
        }
        else {
            DAO dao = new DAO();
            dao.Register(firstName,lastName,email, pass, numPhone, address);
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
