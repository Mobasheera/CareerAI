<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login to Career AI</title>
    <!-- Inter Font from Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
    <!-- Bootstrap CSS from CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <style>
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
            max-width: 400px;
            width: 100%;
            text-align: center;
        }
        .ai-mascot {
            margin-bottom: 20px;
            width: 66px;
            height: 66px;
            filter: drop-shadow(0 6px 38px #6366f18f);
            animation: ai-bounce 2.6s infinite;
        }
        @keyframes ai-bounce {
            0%,100% { transform: translateY(0);}
            40% { transform: translateY(-11px);}
            60% { transform: translateY(-5px);}
        }
        .pulse { animation: pulse 1.4s infinite; }
        @keyframes pulse {
            0% { box-shadow: 0 0 0 0 #8b5cf6bb;}
            80% { box-shadow: 0 0 0 12px transparent; }
            100% { box-shadow: 0 0 0 0 transparent;}
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
        .career-quote {
            min-height: 28px;
            font-style: italic;
            color: #a21caf;
            font-size: 1rem;
            margin-bottom: 18px;
            transition: opacity 0.5s;
        }
        .form-control {
            border-radius: 8px;
            padding: 13px 16px 13px 46px;
            border: 1.5px solid #d1d5db;
            box-shadow: none;
            transition: border 0.3s, box-shadow 0.3s;
        }
        .form-control:focus {
            border: 1.5px solid #6366f1;
            box-shadow: 0 0 0 4px #6366f132;
        }
        .input-icon {
            position: absolute;
            left: 17px;
            top: 50%;
            transform: translateY(-50%);
            color: #6366f1;
            pointer-events: none;
        }
        .input-eye {
            position: absolute;
            right: 10px;
            top: 51%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #b7b7cc;
            font-size: 1.2em;
            cursor: pointer;
            z-index: 3;
        }
        .role-selection {
            display: flex;
            justify-content: center;
            gap: 14px;
            margin-bottom: 15px;
            flex-wrap: wrap;
        }
        .role-selection .form-check-label {
            font-weight: 600;
            color: #6366f1;
            transition: color 0.2s;
        }
        .role-selection .form-check-input:checked~.form-check-label {
            color: #8b5cf6;
        }
        .btn-login {
            background: linear-gradient(90deg, #6366f1 0%, #8b5cf6 100%);
            color: #fff !important;
            font-weight: 800;
            padding: 13px 0;
            border: none;
            border-radius: 99px;
            width: 100%;
            margin-bottom: 6px;
            box-shadow: 0 4px 13px rgb(139 92 246 / 17%);
            transition: all 0.24s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }
        .btn-login:disabled {
            opacity: 0.7;
            pointer-events: none;
        }
        .btn-login:hover, .btn-login:focus {
            background: linear-gradient(90deg, #8b5cf6 15%, #6366f1 85%);
            letter-spacing: .5px;
            transform: translateY(-2px) scale(1.03);
            box-shadow: 0 7px 20px rgb(99 102 241 / 22%);
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
        .register-link a:hover { text-decoration: underline; }
        .footer {
            background: #1c1b23;
            color: #fff;
            padding: 19px 0;
            font-size: 1em;
            text-align: center;
            margin-top: auto;
        }
        .footer a {
            color: #8b5cf6;
            text-underline-offset: 2px;
        }
        .error-message {
            color: #ef4444;
            margin-top: -10px;
            margin-bottom: 14px;
            font-size: .97em;
        }
        /* Position icons for input group */
        .input-group {
            position: relative;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">Career AI</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register.jsp">Register</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="login-wrapper">
        <div class="login-container">
            <!-- Animated AI mascot robot -->
            <div>
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
            </div>
            <h2>Welcome Back!</h2>
            <p class="tagline">Accelerate your career with AI-powered insights.</p>
            <!-- Rotating motivational career tip/quote -->
            <div id="career-quote" class="career-quote"></div>
            <form action="login" method="post" id="loginForm" autocomplete="on">
                <div class="input-group mb-3">
                    <span class="input-icon">
                        <svg width="20" height="20" stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24">
                            <path d="M4 6h16M4 12h16M4 18h16" stroke="#6366f1"/>
                        </svg>
                    </span>
                    <input type="email" class="form-control" id="loginEmail" name="email" placeholder="Email address" required autofocus autocomplete="username">
                </div>
                <div class="input-group mb-3">
                    <span class="input-icon">
                        <svg width="20" height="20" fill="none" stroke="#6366f1" stroke-width="2" viewBox="0 0 24 24">
                            <ellipse cx="12" cy="12" rx="7" ry="5"/>
                            <circle cx="12" cy="12" r="2.5"/>
                        </svg>
                    </span>
                    <input type="password" class="form-control" id="loginPassword" name="password" placeholder="Password" required autocomplete="current-password">
                    <button type="button" id="togglePassword" class="input-eye" tabindex="-1" aria-label="Show or hide password">
                        <svg id="passwordEye" width="20" height="20" stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24">
                            <path d="M1 12S5 4 12 4s11 8 11 8-4 8-11 8S1 12 1 12z"/>
                            <circle cx="12" cy="12" r="3"/>
                        </svg>
                    </button>
                </div>
                
                <%-- Error message from servlet, or for client-side JS --%>
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="error-message" style="display: block;">
                        <%= request.getAttribute("errorMessage") %>
                    </div>
                <% } else { %>
                    <div class="error-message" id="loginErrorMessage"></div>
                <% } %>
                <button type="submit" class="btn btn-login" id="signInBtn">
                    <span id="btnText">Sign In</span>
                    <svg id="btnSpinner" class="d-none" width="20" height="20" viewBox="0 0 50 50" fill="none">
                        <circle cx="25" cy="25" r="18" stroke="white" stroke-width="5" stroke-dasharray="88" stroke-dashoffset="66" stroke-linecap="round"/>
                    </svg>
                </button>
            </form>
            <div class="register-link">
                Don't have an account?
                <a href="register.jsp">Register here</a>
            </div>
        </div>
    </div>
    <footer class="footer">
        <div class="container">
            <p>&copy; 2025 Career AI. All rights reserved.</p>
        </div>
    </footer>
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        // AI motivational quote/tip rota
        const careerQuote = document.getElementById('career-quote');
        const tips = [
            "💡 Keep your resume updated for better opportunities!",
            "🚀 Set a new goal this month. AI is here to track and boost your progress.",
            "🤖 Unlock career insights by exploring your AI-driven dashboard.",
            "✨ Believe in your potential – smart work with Career AI pays off!",
            "🔍 Let AI find jobs that fit you, not the other way around."
        ];
        let tipIdx = 0;
        function rotateTip() {
            careerQuote.style.opacity = 0;
            setTimeout(() => {
                careerQuote.textContent = tips[tipIdx];
                careerQuote.style.opacity = 1;
                tipIdx = (tipIdx + 1) % tips.length;
            }, 250);
        }
        rotateTip();
        setInterval(rotateTip, 4500);

        // Password show/hide toggle
        const loginPassword = document.getElementById('loginPassword');
        const togglePassword = document.getElementById('togglePassword');
        const passwordEye = document.getElementById('passwordEye');
        togglePassword.addEventListener('click', function() {
            const type = loginPassword.type === 'password' ? 'text' : 'password';
            loginPassword.type = type;
            passwordEye.innerHTML = type === 'password'
                ? '<path d="M1 12S5 4 12 4s11 8 11 8-4 8-11 8S1 12 1 12z"/><circle cx="12" cy="12" r="3"/>'
                : '<path d="M1 12S5 4 12 4s11 8 11 8-4 8-11 8S1 12 1 12z"/><line x1="1" y1="1" x2="23" y2="23"/>';
        });

        // Error display logic for JS validation
        const loginForm = document.getElementById('loginForm');
        const loginEmail = document.getElementById('loginEmail');
        const loginErrorMessage = document.getElementById('loginErrorMessage');
        const signInBtn = document.getElementById('signInBtn');
        const btnText = document.getElementById('btnText');
        const btnSpinner = document.getElementById('btnSpinner');

        function showErrorMessage(message) {
            if (loginErrorMessage) {
                loginErrorMessage.textContent = message;
                loginErrorMessage.style.display = 'block';
            }
        }
        function hideErrorMessage() {
            if (loginErrorMessage) {
                loginErrorMessage.textContent = '';
                loginErrorMessage.style.display = 'none';
            }
        }

        loginForm.addEventListener('submit', function(event) {
            hideErrorMessage();
            const email = loginEmail.value.trim();
            const password = loginPassword.value.trim();
            if (!email) {
                showErrorMessage('Email address is required.');
                event.preventDefault(); return;
            }
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                showErrorMessage('Please enter a valid email address.');
                event.preventDefault(); return;
            }
            if (!password) {
                showErrorMessage('Password is required.');
                event.preventDefault(); return;
            }
            if (password.length < 6) {
                showErrorMessage('Password must be at least 6 characters.');
                event.preventDefault(); return;
            }
            // Animate the sign in button as loading
            signInBtn.disabled = true;
            btnText.textContent = "Signing you in...";
            btnSpinner.classList.remove('d-none');
        });

        // Hide error if empty (on JS fallback)
        if (loginErrorMessage && loginErrorMessage.textContent.trim() === '') {
            loginErrorMessage.style.display = 'none';
        }

        // Animate mascot pulse when focusing inputs
        [loginEmail, loginPassword].forEach(input => {
            input.addEventListener('focus', () =>
                document.querySelector('.ai-mascot').classList.add('pulse')
            );
            input.addEventListener('blur', () =>
                document.querySelector('.ai-mascot').classList.remove('pulse')
            );
        });
    });
    </script>
</body>
</html>
