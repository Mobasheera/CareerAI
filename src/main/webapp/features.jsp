<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Career AI Features</title>
    <link href="css/output.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
        body {
            font-family: 'Inter', sans-serif;
            background-color: #0d1117;
            color: #c9d1d9;
            line-height: 1.6;
        }
    </style>
</head>
<body class="bg-gray-950 text-white min-h-screen flex flex-col items-center justify-center p-8">

    <!-- Features Section -->
    <section class="max-w-7xl w-full p-8 md:p-12">
        <h2 class="text-4xl md:text-5xl font-bold text-center mb-12 text-transparent bg-clip-text bg-gradient-to-r from-yellow-400 to-orange-500">
            Powerful Features for Your Success
        </h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <!-- Feature Card 1 -->
            <div class="bg-gray-800 p-8 rounded-2xl shadow-lg border border-gray-700 hover:shadow-xl transform hover:scale-105 transition-all duration-300">
                <div class="text-blue-400 text-4xl mb-4">
                    <svg class="w-12 h-12" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M10 2a8 8 0 100 16A8 8 0 0010 2zm0 14a6 6 0 110-12 6 6 0 010 12zM9 9V5a1 1 0 012 0v4h4a1 1 0 010 2h-4v4a1 1 0 01-2 0v-4H5a1 1 0 010-2h4z"/></svg>
                </div>
                <h3 class="text-2xl font-semibold mb-2">Personalized Path</h3>
                <p class="text-gray-400">Our AI analyzes your skills and interests to create a customized career roadmap.</p>
            </div>
            <!-- Feature Card 2 -->
            <div class="bg-gray-800 p-8 rounded-2xl shadow-lg border border-gray-700 hover:shadow-xl transform hover:scale-105 transition-all duration-300">
                <div class="text-green-400 text-4xl mb-4">
                    <svg class="w-12 h-12" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M10 18a8 8 0 100-16 8 8 0 000 16zM9 10V6a1 1 0 112 0v4h4a1 1 0 110 2h-4v4a1 1 0 11-2 0v-4H6a1 1 0 110-2h3z"/></svg>
                </div>
                <h3 class="text-2xl font-semibold mb-2">Resume Optimization</h3>
                <p class="text-gray-400">Get instant feedback on your resume to improve keywords and formatting for better visibility.</p>
            </div>
            <!-- Feature Card 3 -->
            <div class="bg-gray-800 p-8 rounded-2xl shadow-lg border border-gray-700 hover:shadow-xl transform hover:scale-105 transition-all duration-300">
                <div class="text-pink-400 text-4xl mb-4">
                    <svg class="w-12 h-12" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M10 2a8 8 0 100 16 8 8 0 000-16zM9 10a1 1 0 011-1h1v4a1 1 0 01-2 0v-3z"/></svg>
                </div>
                <h3 class="text-2xl font-semibold mb-2">Interview Prep</h3>
                <p class="text-gray-400">Practice with a mock AI interviewer and receive constructive feedback to ace your next interview.</p>
            </div>
            <!-- Feature Card 4 -->
            <div class="bg-gray-800 p-8 rounded-2xl shadow-lg border border-gray-700 hover:shadow-xl transform hover:scale-105 transition-all duration-300">
                <div class="text-teal-400 text-4xl mb-4">
                    <svg class="w-12 h-12" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M10 18a8 8 0 100-16 8 8 0 000 16zM9 10V6a1 1 0 112 0v4h4a1 1 0 110 2h-4v4a1 1 0 11-2 0v-4H6a1 1 0 110-2h3z"/></svg>
                </div>
                <h3 class="text-2xl font-semibold mb-2">Job Matching</h3>
                <p class="text-gray-400">Our AI algorithm connects you with relevant job openings based on your profile and goals.</p>
            </div>
            <!-- Feature Card 5 -->
            <div class="bg-gray-800 p-8 rounded-2xl shadow-lg border border-gray-700 hover:shadow-xl transform hover:scale-105 transition-all duration-300">
                <div class="text-purple-400 text-4xl mb-4">
                    <svg class="w-12 h-12" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M10 2a8 8 0 100 16A8 8 0 0010 2zm0 14a6 6 0 110-12 6 6 0 010 12zM9 9V5a1 1 0 012 0v4h4a1 1 0 010 2h-4v4a1 1 0 01-2 0v-4H5a1 1 0 010-2h4z"/></svg>
                </div>
                <h3 class="text-2xl font-semibold mb-2">Skill Gap Analysis</h3>
                <p class="text-gray-400">Identify the skills you need to acquire to land your dream job and receive learning recommendations.</p>
            </div>
             <!-- Feature Card 6 -->
            <div class="bg-gray-800 p-8 rounded-2xl shadow-lg border border-gray-700 hover:shadow-xl transform hover:scale-105 transition-all duration-300">
                <div class="text-red-400 text-4xl mb-4">
                    <svg class="w-12 h-12" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M10 18a8 8 0 100-16 8 8 0 000 16zM9 10V6a1 1 0 112 0v4h4a1 1 0 110 2h-4v4a1 1 0 11-2 0v-4H6a1 1 0 110-2h3z"/></svg>
                </div>
                <h3 class="text-2xl font-semibold mb-2">Market Insights</h3>
                <p class="text-gray-400">Stay ahead with real-time data on industry trends, salary benchmarks, and in-demand roles.</p>
            </div>
        </div>
    </section>

</body>
</html>
