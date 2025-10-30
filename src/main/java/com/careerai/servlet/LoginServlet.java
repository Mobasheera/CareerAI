package com.careerai.servlet;

import com.careerai.dao.UserDao;
import com.careerai.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDao userDao;

    @Override
    public void init() {
        userDao = new UserDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        User user = userDao.authenticateUser(email, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);
            response.sendRedirect("dashboard.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid email or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
