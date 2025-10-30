




<%@ page language="java" import="com.careerai.model.User" session="true" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    // Retrieve the currentUser object from the session
    User currentUser = (User) session.getAttribute("currentUser");
    // If currentUser is null, redirect to login page
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My CareerAI Profile</title>
    <!-- Import Google Font - Inter -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        /* Main container styling - min-h-screen relative overflow-hidden flex items-center justify-content: center; p-4 font-inter */
        .main-container {
            min-height: 100vh;
            position: relative;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1rem; /* p-4 */
            font-family: 'Inter', sans-serif;
            transition: background 0.5s ease; /* Smooth transition for background */
        }

        /* Background Gradient (Dark Mode Default) */
        .background-gradient {
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background: linear-gradient(to bottom right, #1a202c, #2d3748, #4a5568); /* Dark blue/gray shades */
            z-index: 0;
            transition: background 0.5s ease;
        }

        /* Abstract Background Shapes (Dark Mode Default) */
        .blob-1, .blob-2, .blob-3 {
            position: absolute;
            border-radius: 9999px;
            mix-blend-mode: multiply;
            filter: blur(4rem);
            transition: background-color 0.5s ease, opacity 0.5s ease;
            z-index: 10;
        }
        .blob-1 { top: 0; left: 0; width: 16rem; height: 16rem; background-color: #667eea; opacity: 0.2; animation: blob 7s infinite alternate; }
        .blob-2 { bottom: 0; right: 0; width: 20rem; height: 20rem; background-color: #805ad5; opacity: 0.2; animation: blob 9s infinite alternate-reverse; animation-delay: 1s; }
        .blob-3 { top: 25%; right: 25%; width: 12rem; height: 12rem; background-color: #4299e1; opacity: 0.2; animation: blob 8s infinite alternate; animation-delay: 0.5s; }

        /* AI Related Design Elements (Dark Mode Default) */
        .ai-bot .fas, .ai-cpu .fas, .ai-sparkle-1 .fas, .ai-sparkle-2 .fas {
            position: absolute;
            opacity: 0.15;
            transition: color 0.5s ease, opacity 0.5s ease;
            z-index: 10;
        }
        .ai-bot .fas { color: #7986cb; font-size: 5rem; top: 33.333333%; left: 25%; transform: translate(-50%, -50%); animation: float 6s ease-in-out infinite; }
        .ai-cpu .fas { color: #b39ddb; font-size: 4.5rem; bottom: 25%; right: 25%; transform: translate(50%, 50%); animation: float-reverse 7s ease-in-out infinite; }
        .ai-sparkle-1 .fas { color: #ffeb3b; font-size: 2.5rem; top: 25%; left: 50%; animation: sparkle 1.5s ease-in-out infinite; animation-delay: 0.3s; }
        .ai-sparkle-2 .fas { color: #81d4fa; font-size: 2rem; bottom: 50%; right: 33.333333%; animation: sparkle 1.5s ease-in-out infinite; animation-delay: 0.7s; }

        /* Profile Box (Dark Mode Default) */
        .profile-box {
            position: relative;
            background-color: #2d3748; /* Dark background for the box */
            border-radius: 1rem;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.3), 0 8px 10px -6px rgba(0, 0, 0, 0.2);
            padding: 1.5rem;
            max-width: 32rem;
            width: 100%;
            transform: scale(1);
            transition: transform 0.5s, box-shadow 0.5s, background-color 0.5s;
            z-index: 20;
        }
        .profile-box:hover {
            transform: scale(1.01);
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.4);
        }
        @media (min-width: 768px) {
            .profile-box { padding: 2.5rem; }
        }

        /* Text (Dark Mode Default) */
        .text-center-mb-8 { text-align: center; margin-bottom: 2rem; }
        .profile-heading { font-size: 2.25rem; font-weight: 800; color: #e2e8f0; margin-bottom: 0.5rem; animation: fadeInDown 0.8s ease-out forwards; transition: color 0.5s ease; }
        .profile-subheading { color: #cbd5e0; font-size: 1.125rem; animation: fadeInUp 0.8s ease-out forwards 0.2s; transition: color 0.5s ease; }

        /* Info Items (Dark Mode Default) */
        .info-section { display: flex; flex-direction: column; gap: 1.5rem; }
        .info-item {
            display: flex;
            align-items: center;
            background-color: #4a5568; /* Darker background for info items */
            padding: 1rem;
            border-radius: 0.75rem;
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.15);
            transition: transform 0.3s, background-color 0.5s, box-shadow 0.5s;
        }
        .info-item:hover { transform: translateX(0.25rem); }

        /* Icon styling (Dark Mode Default) */
        .info-icon { color: #667eea; margin-right: 1rem; flex-shrink: 0; font-size: 1.5rem; transition: color 0.5s ease; }

        /* Text within info item (Dark Mode Default) */
        .info-label { font-size: 0.875rem; font-weight: 500; color: #cbd5e0; transition: color 0.5s ease; }
        .info-value { font-size: 1.125rem; font-weight: 600; color: #e2e8f0; transition: color 0.5s ease; }

        /* Back button (Dark Mode Default) */
        .back-button-container { margin-top: 2.5rem; text-align: center; }
        .back-button {
            background-color: #667eea;
            color: white;
            padding: 0.75rem 2rem;
            border-radius: 9999px;
            font-weight: 700;
            font-size: 1.125rem;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.2), 0 4px 6px -2px rgba(0, 0, 0, 0.1);
            transition: all 0.3s;
            transform: translateY(0) scale(1);
            border: none;
            cursor: pointer;
            animation: bounceIn 0.7s ease-out forwards 1.0s;
        }
        .back-button:hover { background-color: #5a67d8; transform: translateY(-0.25rem) scale(1.05); }
        .back-button:focus { outline: none; box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.5); }
        .back-button .fas { margin-right: 8px; }

        /* Mode Toggle Button */
        .mode-toggle-button {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            width: 45px;
            height: 45px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 1.2rem;
            cursor: pointer;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
            transition: background-color 0.3s ease, color 0.3s ease, border-color 0.3s ease, transform 0.2s ease;
            z-index: 30; /* Ensure it's above other elements */
        }
        .mode-toggle-button:hover {
            background-color: rgba(255, 255, 255, 0.2);
            transform: scale(1.05);
        }
        .mode-toggle-button .fas {
            transition: transform 0.3s ease;
        }
        .mode-toggle-button.light-mode-active .fas {
            transform: rotate(180deg); /* Rotate icon on toggle */
        }


        /* ------------------------------------------------------------------- */
        /* LIGHT MODE STYLES */
        /* ------------------------------------------------------------------- */
        body.light-mode .main-container {
            background: none; /* Reset body background if it was set */
        }

        body.light-mode .background-gradient {
            background: linear-gradient(to bottom right, #e0f2fe, #f0f8ff, #f8faff); /* Light blue/white shades */
        }

        body.light-mode .blob-1 { background-color: rgba(102, 126, 234, 0.1); opacity: 0.1; } /* Lighter, less opaque */
        body.light-mode .blob-2 { background-color: rgba(128, 90, 213, 0.1); opacity: 0.1; }
        body.light-mode .blob-3 { background-color: rgba(66, 153, 225, 0.1); opacity: 0.1; }

        body.light-mode .ai-bot .fas { color: rgba(121, 134, 203, 0.05); opacity: 0.05; } /* Very subtle */
        body.light-mode .ai-cpu .fas { color: rgba(179, 157, 219, 0.05); opacity: 0.05; }
        body.light-mode .ai-sparkle-1 .fas { color: rgba(255, 235, 59, 0.05); opacity: 0.05; }
        body.light-mode .ai-sparkle-2 .fas { color: rgba(129, 212, 250, 0.05); opacity: 0.05; }

        body.light-mode .profile-box {
            background-color: #ffffff; /* Pure white */
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1), 0 4px 8px rgba(0, 0, 0, 0.05);
        }
        body.light-mode .profile-box:hover {
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }

        body.light-mode .profile-heading { color: #333333; }
        body.light-mode .profile-subheading { color: #555555; }

        body.light-mode .info-item {
            background-color: #f0f2f5; /* Light gray */
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.08);
        }

        body.light-mode .info-icon { color: #4f46e5; } /* Retain vibrant blue for icons */

        body.light-mode .info-label { color: #666666; }
        body.light-mode .info-value { color: #333333; }

        body.light-mode .back-button {
            background-color: #4f46e5; /* Indigo blue */
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        body.light-mode .back-button:hover {
            background-color: #4338ca;
        }
        body.light-mode .back-button:focus {
            box-shadow: 0 0 0 4px rgba(79, 70, 229, 0.5);
        }

        body.light-mode .mode-toggle-button {
            background-color: rgba(0, 0, 0, 0.1);
            color: #333333;
            border: 1px solid rgba(0, 0, 0, 0.2);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        body.light-mode .mode-toggle-button:hover {
            background-color: rgba(0, 0, 0, 0.2);
        }

        /* Keyframe animations (unchanged) */
        @keyframes fadeInDown { from { opacity: 0; transform: translateY(-20px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes fadeInUp { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes slideInLeft { from { opacity: 0; transform: translateX(-30px); } to { opacity: 1; transform: translateX(0); } }
        @keyframes slideInRight { from { opacity: 0; transform: translateX(30px); } to { opacity: 1; transform: translateX(0); } }
        @keyframes bounceIn { 0% { opacity: 0; transform: scale(0.3); } 50% { opacity: 1; transform: scale(1.05); } 70% { transform: scale(0.9); } 100% { transform: scale(1); } }
        @keyframes blob { 0% { transform: translate(0px, 0px) scale(1); } 33% { transform: translate(30px, -50px) scale(1.1); } 66% { transform: translate(-20px, 20px) scale(0.9); } 100% { transform: translate(0px, 0px) scale(1); } }
        @keyframes float { 0% { transform: translateY(0px) rotate(0deg); } 50% { transform: translateY(-10px) rotate(5deg); } 100% { transform: translateY(0px) rotate(0deg); } }
        @keyframes float-reverse { 0% { transform: translateY(0px) rotate(0deg); } 50% { transform: translateY(10px) rotate(-5deg); } 100% { transform: translateY(0px) rotate(0deg); } }
        @keyframes sparkle { 0%, 100% { opacity: 0.3; transform: scale(1); } 50% { opacity: 0.8; transform: scale(1.2); } }
    </style>
</head>
<body>
    <div class="main-container">
        <!-- Enhanced Background Gradient -->
        <div class="background-gradient"></div>

        <!-- AI Related Design Elements (Font Awesome Icons) -->
        <div class="ai-bot"><i class="fas fa-robot"></i></div>
        <div class="ai-cpu"><i class="fas fa-microchip"></i></div>
        <div class="ai-sparkle-1"><i class="fas fa-sparkles"></i></div>
        <div class="ai-sparkle-2"><i class="fas fa-sparkles"></i></div>

        <!-- Mode Toggle Button -->
        <button id="modeToggle" class="mode-toggle-button">
            <i class="fas fa-sun"></i> <!-- Sun icon for light mode -->
        </button>

        <!-- Profile Box -->
        <div class="profile-box">
            <div class="text-center-mb-8">
                <h2 class="profile-heading">
                    Your Profile
                </h2>
                <p class="profile-subheading">
                    Welcome to your personalized CareerAI dashboard.
                </p>
            </div>

            <div class="info-section">
                <!-- Full Name -->
                <div class="info-item animate-slide-in-left">
                    <i class="fas fa-user info-icon"></i>
                    <div>
                        <p class="info-label">Full Name</p>
                        <p class="info-value">
                            <%= currentUser.getFullName() %>
                        </p>
                    </div>
                </div>

                <!-- Email -->
                <div class="info-item animate-slide-in-right">
                    <i class="fas fa-envelope info-icon"></i>
                    <div>
                        <p class="info-label">Email Address</p>
                        <p class="info-value">
                            <%= currentUser.getEmail() %>
                        </p>
                    </div>
                </div>

                <!-- Member Since -->
                <div class="info-item animate-slide-in-left">
                    <i class="fas fa-calendar-alt info-icon"></i>
                    <div>
                        <p class="info-label">Member Since</p>
                        <p class="info-value">
                            <%= currentUser.getCreatedAt() %>
                        </p>
                    </div>
                </div>
            </div>

            <!-- Back Button -->
            <div class="back-button-container">
                <form action="dashboard.jsp" method="get">
                    <button
                        type="submit"
                        class="back-button"
                    >
                        <i class="fas fa-arrow-left"></i> Back to Dashboard
                    </button>
                </form>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const modeToggleBtn = document.getElementById('modeToggle');
            const body = document.body;
            const icon = modeToggleBtn.querySelector('.fas');

            // Check for saved theme preference
            const savedTheme = localStorage.getItem('theme');
            if (savedTheme === 'light-mode') {
                body.classList.add('light-mode');
                modeToggleBtn.classList.add('light-mode-active');
                icon.classList.remove('fa-sun');
                icon.classList.add('fa-moon');
            } else {
                // Default to dark mode if no preference or 'dark-mode' is saved
                body.classList.remove('light-mode');
                modeToggleBtn.classList.remove('light-mode-active');
                icon.classList.remove('fa-moon');
                icon.classList.add('fa-sun');
            }

            modeToggleBtn.addEventListener('click', () => {
                body.classList.toggle('light-mode');
                modeToggleBtn.classList.toggle('light-mode-active');

                if (body.classList.contains('light-mode')) {
                    icon.classList.remove('fa-sun');
                    icon.classList.add('fa-moon');
                    localStorage.setItem('theme', 'light-mode');
                } else {
                    icon.classList.remove('fa-moon');
                    icon.classList.add('fa-sun');
                    localStorage.setItem('theme', 'dark-mode');
                }
            });
        });
    </script>
</body>
</html>