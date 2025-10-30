<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Contact - Career AI</title>
  <link href="css/output.css" rel="stylesheet">
</head>
<body class="bg-gradient-to-br from-purple-600 to-indigo-700 text-gray-900 min-h-screen flex flex-col">

  <!-- Navbar -->
  <nav class="bg-gray-900 text-white px-6 py-4 flex justify-between items-center shadow-md">
    <h1 class="text-xl font-bold">Career AI</h1>
    <ul class="flex space-x-6">
      <li><a href="index.jsp" class="hover:text-green-400">Home</a></li>
      <li><a href="features.jsp" class="hover:text-green-400">Features</a></li>
      <li><a href="about.jsp" class="hover:text-green-400">About Us</a></li>
      <li><a href="contact.jsp" class="text-green-400 font-semibold">Contact</a></li>
    </ul>
  </nav>

  <!-- Contact Section -->
  <section class="flex-1 flex items-center justify-center px-6 py-12">
    <div class="bg-white rounded-2xl shadow-2xl max-w-4xl w-full grid md:grid-cols-2">

      <!-- Left Side -->
      <div class="bg-gradient-to-br from-green-400 to-blue-500 text-white rounded-l-2xl p-10 flex flex-col justify-center">
        <h2 class="text-3xl font-bold mb-4">Get in Touch</h2>
        <p class="text-lg mb-6">We’d love to hear from you! Whether you have questions, feedback, or need career guidance — our team is here to help.</p>
        <ul class="space-y-3">
          <li><strong>Email:</strong> support@careerai.com</li>
          <li><strong>Phone:</strong> +91 70398 86061</li>
          <li><strong>Address:</strong> mumbai, India</li>
        </ul>
      </div>

      <!-- Right Side (Form) -->
      <div class="p-10">
        <h3 class="text-2xl font-semibold mb-6">Send us a Message</h3>
        <form action="sendMessageServlet" method="post" class="space-y-5">
          <div>
            <label class="block font-medium mb-2">Name</label>
            <input type="text" name="name" required class="w-full border rounded-lg px-4 py-2 focus:ring-2 focus:ring-indigo-400">
          </div>
          <div>
            <label class="block font-medium mb-2">Email</label>
            <input type="email" name="email" required class="w-full border rounded-lg px-4 py-2 focus:ring-2 focus:ring-indigo-400">
          </div>
          <div>
            <label class="block font-medium mb-2">Message</label>
            <textarea name="message" rows="4" required class="w-full border rounded-lg px-4 py-2 focus:ring-2 focus:ring-indigo-400"></textarea>
          </div>
          <button type="submit" class="w-full bg-indigo-600 text-white py-2 rounded-lg hover:bg-indigo-700 transition">
            Send Message
          </button>
        </form>
      </div>

    </div>
  </section>

  <!-- Footer -->
  <footer class="bg-gray-900 text-gray-300 text-center py-4">
    © 2025 Career AI. All rights reserved.
  </footer>

</body>
</html>
