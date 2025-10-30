package com.careerai.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/quizResult")
public class QuizResultServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String q1 = request.getParameter("q1");
        String q2 = request.getParameter("q2");
        String q3 = request.getParameter("q3");

        String suggestion;
        if ("yes".equals(q1)) suggestion = "Consider careers in Data Science or Finance.";
        else if ("yes".equals(q2)) suggestion = "You might enjoy Graphic Design or Marketing.";
        else if ("yes".equals(q3)) suggestion = "Nursing, Teaching, or Counseling could be for you.";
        else suggestion = "Try exploring different domains to discover your interests.";

        request.setAttribute("suggestion", suggestion);
        request.getRequestDispatcher("suggestRoles.jsp").forward(request, response);
    }
}

