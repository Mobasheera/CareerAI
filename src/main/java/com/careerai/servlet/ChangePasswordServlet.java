package com.careerai.servlet;

import java.io.IOException;

import com.careerai.dao.UserDao;
import com.careerai.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/changePassword")
public class ChangePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");

        UserDao dao = new UserDao();
        boolean success = dao.changePassword(currentUser.getEmail(), currentPassword, newPassword);

        if (success) {
            response.sendRedirect("dashboard.jsp");
        } else {
            request.setAttribute("errorMessage", "Incorrect current password.");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
        }
    }
}

