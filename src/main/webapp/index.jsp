<%-- File: src/main/webapp/index.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Career AI - Unlock Your Potential</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;800&display=swap" rel="stylesheet">

    <!-- Tailwind CSS -->
    <link href="css/output.css" rel="stylesheet">

    <!-- Animate on Scroll (AOS) -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #1e1b4b, #2e1065, #0f172a);
            color: #f8fafc;
            overflow-x: hidden;
        }

        /* Glassmorphism card */
        .glass {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.18);
        }

        /* Button Glow */
        .btn-glow {
            background: linear-gradient(90deg, #6366f1, #a855f7);
            box-shadow: 0 0 20px rgba(168, 85, 247, 0.6);
            transition: all 0.3s ease-in-out;
        }
        .btn-glow:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 0 35px rgba(99, 102, 241, 0.8);
        }

        /* Floating Effect */
        .float-y {
            animation: floatY 6s ease-in-out infinite;
        }
        @keyframes floatY {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-12px); }
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="fixed w-full top-0 z-50 bg-opacity-70 glass px-8 py-4 flex justify-between items-center shadow-lg">
        <a href="#" class="text-2xl font-extrabold tracking-wide">🚀 Career AI</a>
        <ul class="hidden md:flex space-x-10 font-medium">
            <li><a href="#" class="hover:text-indigo-400 transition">Home</a></li>
            <li><a href="features.jsp" class="hover:text-indigo-400 transition">Features</a></li>
            <li><a href="about.jsp" class="hover:text-indigo-400 transition">About</a></li>
            <li><a href="contact.jsp" class="hover:text-indigo-400 transition">Contact</a></li>
        </ul>
        <div class="space-x-4 hidden md:flex">
            <a href="login.jsp" class="px-5 py-2 rounded-lg border border-gray-400 hover:bg-gray-700 transition">Login</a>
            <a href="register.jsp" class="px-5 py-2 rounded-lg btn-glow text-white">Register</a>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="relative flex flex-col justify-center items-center text-center min-h-screen px-6">
        <!-- Background Abstract Shapes -->
        <div class="absolute inset-0 opacity-20 overflow-hidden">
            <div class="w-96 h-96 bg-indigo-600 rounded-full blur-3xl absolute -top-32 -left-20 float-y"></div>
            <div class="w-96 h-96 bg-purple-600 rounded-full blur-3xl absolute bottom-0 right-0 float-y" style="animation-delay:2s;"></div>
        </div>

        <!-- Hero Content -->
        <h1 class="text-6xl md:text-7xl font-extrabold leading-tight mb-6" data-aos="fade-up">Unlock Your <span class="text-indigo-400">Career Potential</span></h1>
        <p class="max-w-3xl mx-auto text-lg md:text-2xl mb-10 text-gray-300" data-aos="fade-up" data-aos-delay="200">
            AI-powered platform to discover, plan, and accelerate your career with real-time insights and personalized guidance.
        </p>
        <div class="flex flex-col sm:flex-row gap-6 justify-center" data-aos="zoom-in" data-aos-delay="400">
            <a href="#features" class="btn-glow text-white px-8 py-4 rounded-full font-semibold">Explore Features</a>
            <a href="register.jsp" class="px-8 py-4 rounded-full border border-gray-300 hover:bg-gray-700 transition">Get Started</a>
        </div>
    </section>

    <!-- Features -->
    <section id="features" class="py-24 container mx-auto px-8">
        <h2 class="text-5xl font-extrabold text-center mb-20" data-aos="fade-up">Why <span class="text-indigo-400">Career AI</span>?</h2>

        <div class="grid md:grid-cols-3 gap-12">
            <!-- Feature 1 -->
            <div class="glass p-10 rounded-3xl shadow-xl hover:scale-105 transition" data-aos="fade-right">
                <h3 class="text-2xl font-bold mb-4">🎯 AI-Powered Job Matching</h3>
                <p class="text-gray-300">Get tailored job opportunities with smart matching algorithms that understand your goals.</p>
            </div>

            <!-- Feature 2 -->
            <div class="glass p-10 rounded-3xl shadow-xl hover:scale-105 transition" data-aos="zoom-in">
                <h3 class="text-2xl font-bold mb-4">📚 Personalized Skill Roadmap</h3>
                <p class="text-gray-300">Bridge your skill gaps with custom learning paths and top-tier resources curated by AI.</p>
            </div>

            <!-- Feature 3 -->
            <div class="glass p-10 rounded-3xl shadow-xl hover:scale-105 transition" data-aos="fade-left">
                <h3 class="text-2xl font-bold mb-4">💼 Resume & Interview Boost</h3>
                <p class="text-gray-300">Level up your applications with AI-driven resume checks and mock interview coaching.</p>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="glass py-10 text-center mt-16">
        <p class="text-gray-400">&copy; 2025 Career AI. All rights reserved.</p>
        <div class="mt-4 flex justify-center gap-6">
            <a href="#" class="hover:text-white">Privacy Policy</a>
            <a href="#" class="hover:text-white">Terms</a>
            <a href="contact.jsp" class="hover:text-white">Contact</a>
        </div>
    </footer>

    <!-- AOS Init -->
    <script>
        AOS.init({ duration: 1200 });
    </script>
</body>
</html>
