package com.careerai.servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/uploadResume")
@MultipartConfig
public class ResumeUploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Part filePart = request.getPart("resume");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadDir = getServletContext().getRealPath("/") + "resumes";

        File uploads = new File(uploadDir);
        if (!uploads.exists()) uploads.mkdirs();

        filePart.write(uploadDir + File.separator + fileName);

        request.setAttribute("message", "Resume uploaded successfully!");
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}
