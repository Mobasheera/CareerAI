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

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve new username and user's email from the form
        String username = request.getParameter("username");
        String email = request.getParameter("email");

        // Update the username in the database
        UserDao dao = new UserDao();
        dao.updateUsername(email, username);

        // Fetch the updated user object and update the session
        HttpSession session = request.getSession();
        User updatedUser = dao.getUserByEmail(email);
        session.setAttribute("currentUser", updatedUser);

        // Redirect to dashboard
        response.sendRedirect("dashboard.jsp");
    }
}
