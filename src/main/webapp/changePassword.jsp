<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%
    String error = (String) request.getAttribute("errorMessage");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Change Password - Career AI</title>
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
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Change Password</h2>

        <% if (error != null) { %>
            <div class="alert alert-danger" role="alert">
                <i class="fas fa-exclamation-triangle me-2"></i><%= error %>
            </div>
        <% } %>

        <form action="changePassword" method="post" novalidate>
            <div class="mb-4">
                <label for="currentPassword" class="form-label">Current Password</label>
                <input
                    type="password"
                    class="form-control"
                    id="currentPassword"
                    name="currentPassword"
                    required
                    minlength="6"
                />
                <div class="invalid-feedback">
                    Please enter your current password (minimum 6 characters).
                </div>
            </div>

            <div class="mb-4">
                <label for="newPassword" class="form-label">New Password</label>
                <input
                    type="password"
                    class="form-control"
                    id="newPassword"
                    name="newPassword"
                    required
                    minlength="6"
                />
                <div class="invalid-feedback">
                    Please enter a new password (minimum 6 characters).
                </div>
            </div>

            <button type="submit" class="btn btn-submit w-100 py-2">
                <i class="fas fa-key me-2"></i> Change Password
            </button>
        </form>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Bootstrap validation script
        (() => {
            'use strict';
            const forms = document.querySelectorAll('form[novalidate]');
            Array.from(forms).forEach(form => {
                form.addEventListener('submit', event => {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        })();
    </script>
</body>
</html>
