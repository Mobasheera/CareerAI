package com.careerai.servlet;

import com.careerai.dao.UserDao;
import com.careerai.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserDao userDao;

    @Override
    public void init() {
        userDao = new UserDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (fullName == null || fullName.isEmpty() ||
            email == null || email.isEmpty() ||
            password == null || password.isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        User user = new User(fullName, email, password);

        boolean registered = userDao.registerUser(user);

        if (registered) {
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("errorMessage", "Registration failed. Try again.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
