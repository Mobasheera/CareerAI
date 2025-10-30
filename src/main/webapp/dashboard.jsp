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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Career AI Dashboard</title>
    <!-- Bootstrap 5 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #f8f9fa;
            transition: background 0.2s, color 0.2s;
        }
        .sidebar {
            min-height: 100vh;
            background-color: #2c2266;
            color: #fff;
            position: fixed;
            left: 0;
            top: 0;
            width: 250px;
            transition: all 0.3s;
            z-index: 1030;
        }
        .sidebar .nav-link, 
        .sidebar .nav-link:active,
        .sidebar .nav-link:focus {
            color: #e0e0e0;
        }
        .sidebar .nav-link.active, 
        .sidebar .nav-link:hover {
            background-color: #4933a7;
            color: #fff;
        }
        .sidebar .sidebar-header {
            font-size: 1.3rem;
            font-weight: bold;
            padding: 1.5rem 1rem 1rem 1.5rem;
            letter-spacing: 1px;
            background-color: #211650;
        }
        .sidebar .user-info {
            padding: 1rem 1.5rem;
            border-bottom: 1px solid #483898;
        }
        .content-area {
            margin-left: 250px;
            padding: 2rem;
            transition: margin-left 0.3s, background 0.2s, color 0.2s;
        }
        .sidebar-collapsed {
            width: 70px !important;
        }
        .sidebar-collapsed .sidebar-header,
        .sidebar-collapsed .user-info,
        .sidebar-collapsed .nav-link span {
            display: none;
        }
        .sidebar-collapsed .nav-link {
            text-align: center;
        }
        .toggle-btn {
            display: none;
        }
        .dark-mode {
            background: #15161a !important;
            color: #d3d6dc !important;
        }
        .dark-mode .content-area {
            background: #15161a;
            color: #d3d6dc;
        }
        .dark-mode .sidebar {
            background-color: #181c32;
            color: #eee;
        }
        .dark-mode .sidebar .sidebar-header {
            background-color: #10131b;
        }
        .dark-mode .sidebar .user-info {
            border-bottom: 1px solid #2c387e;
        }
        .dark-mode .sidebar .nav-link,
        .dark-mode .sidebar .nav-link:focus {
            color: #adb5bd;
        }
        .dark-mode .sidebar .nav-link.active,
        .dark-mode .sidebar .nav-link:hover {
            background-color: #2c387e;
            color: #fff;
        }
        .dark-mode .card {
            background-color: #232836;
            color: #ebecef;
            border: none;
        }
        .dark-mode .btn-darkmode {
            background: #181c32;
            color: #fff;
            border: 1px solid #342b6c;
        }
        @media (max-width: 991.98px) {
            .sidebar {
                left: -250px;
            }
            .sidebar.show {
                left: 0;
            }
            .content-area {
                margin-left: 0;
                padding: 1.5rem 0.5rem 1.5rem 0.5rem;
            }
            .toggle-btn {
                display: block;
                position: fixed;
                top: 18px; left: 18px;
                z-index: 1050;
                background: #2c2266;
                border: none;
                border-radius: 5px;
                color: #fff;
                width: 40px;
                height: 40px;
            }
        }
        .btn-darkmode {
            position: absolute;
            top: 28px;
            right: 32px;
            z-index: 1100;
            background: #342b6c;
            color: #fff;
            border: none;
            border-radius: 24px;
            padding: 0.4rem 1.1rem;
            font-size: 1rem;
            transition: 0.18s;
        }
        .btn-darkmode:hover {
            background: #16152a;
            color: #ffe85a;
        }
        /* Widget Cards */
        .dashboard-widgets {
            margin-top: 1.5rem;
        }
        .dashboard-widgets .card {
            min-height: 135px;
        }
        .dashboard-widgets .iconbg {
            font-size: 2.1rem;
            background: #eee6fd;
            color: #7c47d8;
            border-radius: 8px;
            padding: 0.6rem;
            margin-bottom: 0.7rem;
        }
        .dark-mode .dashboard-widgets .iconbg {
            background: #1a1d29;
            color: #b197fc;
        }
    </style>
</head>
<body>
    <button class="toggle-btn" id="sidebarToggle"><i class="fas fa-bars"></i></button>
    <button class="btn btn-darkmode" id="darkModeToggle"><i class="fas fa-moon"></i></button>
    <nav class="sidebar shadow-lg" id="sidebarMenu">
        <div class="sidebar-header">
            <i class="fas fa-rocket me-2"></i>Career AI
        </div>
        <div class="user-info">
            <div class="fw-semibold"><%= currentUser.getFullName() %></div>
            <small ><%= currentUser.getEmail() %></small>
        </div>
        <ul class="nav flex-column mt-4">
            <li class="nav-item">
                <a href="profile.jsp" class="nav-link"><i class="fas fa-user"></i> <span>Profile</span></a>
            </li>
            <li class="nav-item">
                <a href="uploadResume.jsp" class="nav-link"><i class="fas fa-file-upload"></i> <span>Upload Resume</span></a>
            </li>
            <li class="nav-item">
                <a href="candidateForm.jsp" class="nav-link"><i class="fas fa-pen"></i> <span>Complete Form</span></a>
            </li>
            <li class="nav-item">
                <a href="career_suggestion.jsp" class="nav-link"><i class="fas fa-lightbulb"></i> <span>Career Suggestions</span></a>
            </li>
            <li class="nav-item">
                <a href="careerQuiz.jsp" class="nav-link"><i class="fas fa-question-circle"></i> <span>Career Quiz</span></a>
            </li>
            <li class="nav-item">
                <a href="editProfile.jsp" class="nav-link"><i class="fas fa-user-edit"></i> <span>Edit Profile</span></a>
            </li>
            <li class="nav-item">
                <a href="changePassword.jsp" class="nav-link"><i class="fas fa-lock"></i> <span>Change Password</span></a>
            </li>
            <li class="nav-item">
                <a href="dashboardStats.jsp" class="nav-link"><i class="fas fa-chart-line"></i> <span>Statistics</span></a>
            </li>
              <li class="nav-item mt-3">
                <form action="logout.jsp" method="post">
                    <button type="submit" class="nav-link w-100 logout-link" style="text-align:left;">
                        <i class="fas fa-sign-out-alt"></i> <span>Logout</span>
                    </button>
                </form>
            </li>
        </ul>
    </nav>

    <main class="content-area">
        <div class="container-fluid">
            <h2 class="mb-2">Dashboard</h2>
            <p class="lead mb-3">Access and manage your career profile, resources, and personalized suggestions in one place.</p>
            
            <!-- Dashboard Widgets Section -->
            <div class="row dashboard-widgets">
                <div class="col-md-4 mb-4">
                    <div class="card p-3 shadow-sm h-100">
                        <div class="iconbg mx-auto"><i class="fas fa-user-circle"></i></div>
                        <h5 class="fw-bold text-center mb-1">Profile Completion</h5>
                        <p class="text-center mb-0">85% Complete</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card p-3 shadow-sm h-100">
                        <div class="iconbg mx-auto"><i class="fas fa-briefcase"></i></div>
                        <h5 class="fw-bold text-center mb-1">Suggested Roles</h5>
                        <p class="text-center mb-0">3 New Matches</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card p-3 shadow-sm h-100">
                        <div class="iconbg mx-auto"><i class="fas fa-chart-bar"></i></div>
                        <h5 class="fw-bold text-center mb-1">Last Assessment</h5>
                        <p class="text-center mb-0">Scored: 92%</p>
                    </div>
                </div>
            </div>
            
            <!-- Advanced UI element: Notifications -->
            <div class="alert alert-info mt-4" role="alert">
                <i class="fas fa-bell"></i> <strong>Tip:</strong> Keep your profile updated to receive better career suggestions!
            </div>
        </div>
    </main>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Sidebar toggle logic for responsive layout
        const sidebar = document.getElementById('sidebarMenu');
        const toggleBtn = document.getElementById('sidebarToggle');
        toggleBtn.addEventListener('click', function () {
            sidebar.classList.toggle('show');
        });
        document.addEventListener('click', function(event) {
            if (window.innerWidth < 992) {
                if (!sidebar.contains(event.target) && !toggleBtn.contains(event.target)) {
                    sidebar.classList.remove('show');
                }
            }
        });

        // Dark Mode logic
        const darkToggle = document.getElementById('darkModeToggle');
        darkToggle.addEventListener('click', function () {
            document.body.classList.toggle('dark-mode');
        });
    </script>
    <!-- existing dashboard code -->

<!-- At the end before closing body tag: -->
<script>
  window.addEventListener('DOMContentLoaded', () => {
    const newScore = localStorage.getItem('lastAssessmentScore');
    const newSuggested = localStorage.getItem('suggestedRoles');

    if (newScore) {
      const lastAssessmentCard = document.querySelector('.dashboard-widgets .col-md-4:nth-child(3) p');
      if (lastAssessmentCard) {
        lastAssessmentCard.textContent = `Scored: ${newScore}%`;
      }
      localStorage.removeItem('lastAssessmentScore');
    }

    if (newSuggested) {
      const suggestedRolesCard = document.querySelector('.dashboard-widgets .col-md-4:nth-child(2) p');
      if (suggestedRolesCard) {
        suggestedRolesCard.textContent = newSuggested;
      }
      localStorage.removeItem('suggestedRoles');
    }
  });
</script>
    
</body>
</html>
