package com.careerai.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.careerai.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/sendMessageServlet")
public class SendMessageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        try (Connection con = DBConnection.getConnection()) {   // ✅ use your DBConnection

            String sql = "INSERT INTO contact_messages (name, email, message) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, message);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Message sent successfully!');");
                out.println("location='contact.jsp';");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Failed to send message. Try again!');");
                out.println("location='contact.jsp';");
                out.println("</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Error: " + e.getMessage() + "');");
            out.println("location='contact.jsp';");
            out.println("</script>");
        }
    }
}
