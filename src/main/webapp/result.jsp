<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Career AI Result</title>
    <link href="css/output.css" rel="stylesheet">
</head>
<body class="bg-gray-100 flex justify-center items-center min-h-screen">
<div class="bg-white p-8 rounded-xl shadow-md max-w-2xl w-full">
    <h1 class="text-2xl font-bold text-center text-green-600 mb-4">Your Career Suggestions</h1>
    <div class="text-gray-800 whitespace-pre-line">
        <% 
            String suggestion = (String) request.getAttribute("suggestion");
            String error = (String) request.getAttribute("error");
            String errorDetails = (String) request.getAttribute("errorDetails");
            if (error != null) {
        %>
            <p class="text-red-600"><%= error %></p>
            <% if (errorDetails != null && !errorDetails.isEmpty()) { %>
            <pre class="mt-3 p-3 bg-red-50 text-red-700 rounded overflow-auto text-sm"><%= errorDetails %></pre>
            <% } %>
        <% } else if (suggestion != null) { %>
            <p><%= suggestion %></p>
        <% } else { %>
            <p>No response received.</p>
        <% } %>
    </div>
    <div class="text-center mt-6">
        <a href="career_suggestion.jsp" class="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700">Try Again</a>
    </div>
</div>
</body>
</html>
