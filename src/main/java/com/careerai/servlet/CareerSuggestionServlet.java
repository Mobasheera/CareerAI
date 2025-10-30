package com.careerai.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import okhttp3.*;
import org.json.JSONObject;
import org.json.JSONArray;

@WebServlet("/CareerSuggestionServlet")
public class CareerSuggestionServlet extends HttpServlet {

    // Fetch the Groq API key from environment variable
    private static final String GROQ_API_KEY = System.getenv("OPENAI_API_KEY");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String education = request.getParameter("education");
        String skills = request.getParameter("skills");
        String interests = request.getParameter("interests");

        // Validate API key
        if (GROQ_API_KEY == null || GROQ_API_KEY.isEmpty()) {
            request.setAttribute("error", "API key not found in environment variables.");
            request.getRequestDispatcher("result.jsp").forward(request, response);
            return;
        }

        // Validate inputs
        if ((education == null || education.trim().isEmpty()) &&
            (skills == null || skills.trim().isEmpty()) &&
            (interests == null || interests.trim().isEmpty())) {
            request.setAttribute("error", "Please provide at least one of education, skills, or interests.");
            request.getRequestDispatcher("result.jsp").forward(request, response);
            return;
        }

        // Prepare prompt
        String prompt = "Suggest 3 ideal career paths for the following:\n"
                + "Education: " + education + "\n"
                + "Skills: " + skills + "\n"
                + "Interests: " + interests + "\n"
                + "Explain briefly why each career fits.";

        OkHttpClient client = new OkHttpClient();
        JSONObject jsonBody = new JSONObject();

        // Groq-compatible model and base URL
        final String apiBase = "https://api.groq.com/openai/v1";
        final String model = "llama-3.1-8b-instant"; // a fast Groq model suitable for this

        jsonBody.put("model", model);
        jsonBody.put("messages", new JSONArray()
                .put(new JSONObject()
                        .put("role", "user")
                        .put("content", prompt)));

        RequestBody body = RequestBody.create(
                jsonBody.toString(),
                MediaType.get("application/json; charset=utf-8")
        );

        Request httpRequest = new Request.Builder()
                .url(apiBase + "/chat/completions")
                .addHeader("Authorization", "Bearer " + GROQ_API_KEY)
                .addHeader("Content-Type", "application/json")
                .post(body)
                .build();

        try (Response apiResponse = client.newCall(httpRequest).execute()) {
            if (!apiResponse.isSuccessful()) {
                String errorBody = apiResponse.body() != null ? apiResponse.body().string() : "";
                request.setAttribute("error", "API call failed: " + apiResponse.code());
                request.setAttribute("errorDetails", errorBody);
                request.getRequestDispatcher("result.jsp").forward(request, response);
                return;
            }

            String responseBody = apiResponse.body().string();
            JSONObject json = new JSONObject(responseBody);
            String suggestion = json
                    .getJSONArray("choices")
                    .getJSONObject(0)
                    .getJSONObject("message")
                    .getString("content");

            request.setAttribute("suggestion", suggestion);
            request.getRequestDispatcher("result.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("result.jsp").forward(request, response);
        }
    }
}
