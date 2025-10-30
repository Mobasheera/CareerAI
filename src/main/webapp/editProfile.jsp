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
    <meta charset="UTF-8" />
    <title>Edit Profile - Career AI</title>
    <!-- Bootstrap 5 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        body {
            background: #f8f9fa;
            font-family: 'Segoe UI', Arial, sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding-top: 40px;
        }
        .form-container {
            max-width: 480px;
            width: 100%;
            background: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }
        h2 {
            font-weight: 600;
            margin-bottom: 25px;
            color: #343a40;
        }
        .btn-submit {
            background-color: #6f42c1;
            border: none;
            border-radius: 8px;
        }
        .btn-submit:hover {
            background-color: #5a32a3;
        }
        label {
            font-weight: 600;
        }
        input[readonly] {
            background-color: #e9ecef;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Edit Profile</h2>
        <form action="updateProfile" method="post" novalidate>
            <div class="mb-4">
                <label for="username" class="form-label">Name</label>
                <input
                    type="text"
                    class="form-control"
                    id="username"
                    name="username"
                    value="<%= currentUser.getFullName() %>"
                    required
                />
                <div class="invalid-feedback">Please enter your full name.</div>
            </div>
            <div class="mb-4">
                <label for="email" class="form-label">Email</label>
                <input
                    type="email"
                    class="form-control"
                    id="email"
                    name="email"
                    value="<%= currentUser.getEmail() %>"
                    readonly
                />
            </div>
            <button type="submit" class="btn btn-submit w-100 py-2">
                <i class="fas fa-save me-2"></i> Update Profile
            </button>
        </form>
    </div>

    <!-- Bootstrap 5 JS Bundle (with Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Bootstrap 5 built-in validation
        (() => {
            'use strict';
            const forms = document.querySelectorAll('form[novalidate]');
            Array.from(forms).forEach((form) => {
                form.addEventListener(
                    'submit',
                    (event) => {
                        if (!form.checkValidity()) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    },
                    false
                );
            });
        })();
    </script>
</body>
</html>
