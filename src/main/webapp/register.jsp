<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Career AI</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <style>
        /* All styles copied from login.jsp for consistent look */
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(99deg, #6366f1 0%, #8b5cf6 90%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            margin: 0;
        }
        .navbar {
            background: #18181b;
        }
        .navbar-brand, .navbar-nav .nav-link {
            color: #fff !important;
        }
        .login-wrapper {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 32px;
        }
        .login-container {
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 10px 42px rgb(99 102 241 / 18%);
            padding: 36px 30px 28px 30px;
            max-width: 450px;
            width: 100%;
            text-align: center;
        }
        .ai-mascot {
            margin-bottom: 20px;
            width: 66px;
            height: 66px;
            filter: drop-shadow(0 6px 38px #6366f18f);
        }
        h2 {
            color: #18181b;
            font-weight: 800;
            margin-bottom: 8px;
        }
        p.tagline {
            color: #6366f1;
            font-weight: 500;
            margin-bottom: 18px;
        }
        .input-group {
            position: relative;
        }
        .form-control {
            border-radius: 8px;
            padding: 13px 16px 13px 46px;
            border: 1.5px solid #d1d5db;
            box-shadow: none;
        }
        .input-icon {
            position: absolute;
            left: 17px;
            top: 50%;
            transform: translateY(-50%);
            color: #6366f1;
        }
        .btn-login {
            background: linear-gradient(90deg, #6366f1 0%, #8b5cf6 100%);
            color: #fff;
            font-weight: 800;
            padding: 13px 0;
            border: none;
            border-radius: 99px;
            width: 100%;
            margin-top: 10px;
            box-shadow: 0 4px 13px rgb(139 92 246 / 17%);
        }
        .btn-login:hover {
            background: linear-gradient(90deg, #8b5cf6 15%, #6366f1 85%);
            transform: translateY(-2px) scale(1.03);
        }
        .register-link {
            margin-top: 13px;
            font-size: .99rem;
        }
        .register-link a {
            color: #6366f1;
            font-weight: 700;
            text-decoration: none;
        }
        .error-message {
            color: #ef4444;
            font-size: .9em;
            margin-bottom: 10px;
        }
        .footer {
            background: #1c1b23;
            color: #fff;
            padding: 19px 0;
            font-size: 1em;
            text-align: center;
            margin-top: auto;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Career AI</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav" aria-controls="navbarNav"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                <li class="nav-item"><a class="nav-link active" href="register.jsp">Register</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="login-wrapper">
    <div class="login-container">
        <svg class="ai-mascot" viewBox="0 0 64 64">
            <circle cx="32" cy="32" r="30" fill="#eef2ff"/>
            <ellipse cx="32" cy="44" rx="19" ry="9" fill="#c7d2fe" opacity="0.8"/>
            <rect x="18" y="24" width="28" height="20" rx="10" fill="#6366f1"/>
            <circle cx="25" cy="34" r="3" fill="#fff"/>
            <circle cx="39" cy="34" r="3" fill="#fff"/>
            <rect x="28" y="40" width="8" height="2" rx="1" fill="#fff"/>
            <rect x="29" y="18" width="6" height="10" rx="3" fill="#8b5cf6"/>
            <ellipse cx="32" cy="10" rx="3" ry="2" fill="#8b5cf6"/>
        </svg>
        <h2>Create Your Account</h2>
        <p class="tagline">Start your AI-powered career journey!</p>

        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>

        <form action="register" method="post">
            <div class="input-group mb-3">
                <span class="input-icon">
                    <i class="bi bi-person-fill"></i>
                </span>
                <input type="text" class="form-control" name="fullName" placeholder="Full Name" required>
            </div>
            <div class="input-group mb-3">
                <span class="input-icon">@</span>
                <input type="email" class="form-control" name="email" placeholder="Email Address" required>
            </div>
            <div class="input-group mb-3">
                <span class="input-icon">🔒</span>
                <input type="password" class="form-control" name="password" placeholder="Password" required>
            </div>
            <div class="input-group mb-3">
                <span class="input-icon">🔒</span>
                <input type="password" class="form-control" name="confirmPassword" placeholder="Confirm Password" required>
            </div>
            <button type="submit" class="btn btn-login">Register</button>
        </form>
        <div class="register-link">
            Already have an account? <a href="login.jsp">Login here</a>
        </div>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p>&copy; 2025 Career AI. All rights reserved.</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
