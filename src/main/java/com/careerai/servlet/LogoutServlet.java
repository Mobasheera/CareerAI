// File: src/main/java/com/careerai/servlet/LogoutServlet.java

package com.careerai.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Don't create if it doesn't exist
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect("login.jsp");
    }
}
