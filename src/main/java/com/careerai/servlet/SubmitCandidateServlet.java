package com.careerai.servlet;

import java.io.IOException;

import com.careerai.dao.CandidateDao;
import com.careerai.model.Candidate;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SubmitCandidateServlet")
public class SubmitCandidateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Collect form data
        String fullName = request.getParameter("fullName");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String education = request.getParameter("education");
        String subjects = request.getParameter("subjects");

        // Multiple hobbies → collect as comma-separated string
        String[] hobbiesArr = request.getParameterValues("hobbies");
        String hobbies = (hobbiesArr != null) ? String.join(", ", hobbiesArr) : "";

        String strengths = request.getParameter("strengths");
        String weaknesses = request.getParameter("weaknesses");
        String domains = request.getParameter("domains");
        String experience = request.getParameter("experience");

        // Build Candidate object
        Candidate candidate = new Candidate();
        candidate.setFullName(fullName);
        candidate.setAge((age != null && !age.isEmpty()) ? Integer.parseInt(age) : 0);
        candidate.setGender(gender);
        candidate.setEducation(education);
        candidate.setSubjects(subjects);
        candidate.setHobbies(hobbies);
        candidate.setStrengths(strengths);
        candidate.setWeaknesses(weaknesses);
        candidate.setDomains(domains);
        candidate.setExperience(experience);

        // DAO call
        CandidateDao dao = new CandidateDao();
        boolean isSaved = dao.saveCandidate(candidate);

       if (isSaved) {
          // Store candidate in session (if needed later)
           HttpSession session = request.getSession();
           session.setAttribute("candidateProfile", candidate);

           response.sendRedirect("dashboard.jsp");
       } else {
          response.sendRedirect("error.jsp");
     }
    }
}
