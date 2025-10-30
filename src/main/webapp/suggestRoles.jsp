<%@ page import="com.careerai.model.User" %>
<%@ page session="true" %>
<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Career Suggestions - Career AI</title>
    <meta charset="UTF-8"> <%-- Ensure UTF-8 meta tag is present --%>
    <!-- Font Awesome CSS for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to bottom right, #2b5876, #4e4376);
            color: white;
            margin: 0;
            padding: 0;
            display: flex; /* Use flexbox for centering */
            justify-content: center;
            align-items: center;
            min-height: 100vh; /* Full viewport height */
            box-sizing: border-box;
        }
        .container {
            max-width: 800px;
            width: 90%; /* Make it responsive */
            margin: 40px auto;
            background-color: rgba(0, 0, 0, 0.6);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3); /* Add subtle shadow */
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 2.2em; /* Slightly larger heading */
        }
        form {
            text-align: center;
        }
        label {
            display: block; /* Ensure label is on its own line */
            margin-bottom: 10px;
            font-size: 1.1em;
        }
        textarea {
            width: calc(100% - 20px); /* Adjust width for padding */
            height: 120px;
            padding: 10px;
            font-size: 16px;
            border-radius: 6px;
            border: none;
            resize: vertical; /* Allow vertical resizing */
            background-color: rgba(255, 255, 255, 0.9); /* Slightly transparent white background */
            color: #333; /* Dark text for readability */
        }
        input[type="submit"] {
            background-color: #00c6ff;
            color: white;
            padding: 12px 30px; /* More padding */
            margin-top: 25px; /* More margin */
            font-size: 1.1em; /* Slightly larger font */
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease; /* Smooth transitions */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* Button shadow */
        }
        input[type="submit"]:hover {
            background-color: #0099cc; /* Darker blue on hover */
            transform: translateY(-2px); /* Lift effect */
        }
        .results {
            margin-top: 30px;
            text-align: left; /* Align results text to left */
        }
        .career-box {
            background-color: rgba(51, 51, 51, 0.8); /* Slightly transparent dark gray */
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 6px;
            display: flex; /* Use flexbox for icon and text alignment */
            align-items: center;
            font-size: 1.1em;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            transition: background-color 0.3s ease;
        }
        .career-box:hover {
            background-color: rgba(68, 68, 68, 0.9); /* Darker on hover */
        }
        .career-box .fas {
            margin-right: 10px; /* Space between icon and text */
            font-size: 1.2em; /* Larger icon size */
            color: #00c6ff; /* Highlight icons with a vibrant color */
        }
        /* Style for the back button */
        .back-button-container {
            margin-top: 30px;
            text-align: center;
        }
        .back-button {
            background-color: #555;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
            text-decoration: none; /* Remove underline for anchor tag */
            display: inline-block; /* Allow padding and margin */
            font-size: 1em;
        }
        .back-button:hover {
            background-color: #777;
            transform: translateY(-2px);
        }
        .back-button .fas {
            margin-right: 8px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2><i class="fas fa-lightbulb"></i> Career Suggestions</h2>
        <form method="post">
            <label for="interests">Enter your interests, skills or goals:</label><br><br>
            <textarea name="interests" placeholder="e.g., I love coding, design, AI, solving problems..."></textarea><br>
            <input type="submit" value="Suggest Careers">
        </form>

        <div class="results">
            <%
                String interests = request.getParameter("interests");
                if (interests != null && !interests.trim().isEmpty()) {
                    interests = interests.toLowerCase();

                    // Simple logic (can be replaced by ML model later)
                    if (interests.contains("code") || interests.contains("developer") || interests.contains("java")) {
            %>
                        <div class="career-box"><i class="fas fa-laptop-code"></i> Software Developer</div>
                        <div class="career-box"><i class="fas fa-brain"></i> AI/ML Engineer</div>
                        <div class="career-box"><i class="fas fa-mobile-alt"></i> Mobile App Developer</div>
            <%
                    } else if (interests.contains("design") || interests.contains("ui") || interests.contains("ux")) {
            %>
                        <div class="career-box"><i class="fas fa-paint-brush"></i> UI/UX Designer</div>
                        <div class="career-box"><i class="fas fa-palette"></i> Graphic Designer</div>
            <%
                    } else if (interests.contains("data") || interests.contains("analytics") || interests.contains("statistics")) {
            %>
                        <div class="career-box"><i class="fas fa-chart-line"></i> Data Analyst</div>
                        <div class="career-box"><i class="fas fa-chart-pie"></i> Business Intelligence Analyst</div>
                        <div class="career-box"><i class="fas fa-calculator"></i> Data Scientist</div>
            <%
                    } else {
            %>
                        <div class="career-box"><i class="fas fa-search"></i> Career not found based on current input. Try refining your interests.</div>
            <%
                    }
                }
            %>
        </div>
        
        <div class="back-button-container">
            <a href="dashboard.jsp" class="back-button"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
