<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Candidate Information Form - Career AI</title>
    <!-- Tailwind CSS CDN -->
    <link href="css/output.css" rel="stylesheet">
    <!-- Font Awesome CDN for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Google Fonts for 'Inter' -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
    </style>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center p-4">

    <div class="w-full max-w-4xl mx-auto p-8 bg-white rounded-xl shadow-lg mt-10 mb-10">
        <h2 class="text-3xl font-bold text-blue-600 mb-6 text-center">
            <i class="fas fa-user-edit"></i> Candidate Profile Builder
        </h2>

        <form action="SubmitCandidateServlet" method="post">
            
            <h5 class="text-xl font-semibold text-gray-700 border-b-2 border-blue-500 pb-2 mb-4 mt-8">
                Personal Information
            </h5>
            
            <div class="mb-4">
                <label for="fullName" class="block text-gray-700 font-medium mb-1">
                    <i class="fas fa-user text-blue-500 mr-2"></i>Full Name
                </label>
                <input type="text" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" id="fullName" name="fullName" required>
            </div>

            <div class="flex flex-wrap -mx-2">
                <div class="w-full md:w-1/2 px-2 mb-4">
                    <label for="age" class="block text-gray-700 font-medium mb-1">
                        <i class="fas fa-birthday-cake text-blue-500 mr-2"></i>Age
                    </label>
                    <input type="number" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" id="age" name="age" required>
                </div>
                <div class="w-full md:w-1/2 px-2 mb-4">
                    <label for="gender" class="block text-gray-700 font-medium mb-1">
                        <i class="fas fa-venus-mars text-blue-500 mr-2"></i>Gender
                    </label>
                    <select class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" id="gender" name="gender" required>
                        <option value="">Select</option>
                        <option>Male</option>
                        <option>Female</option>
                        <option>Other</option>
                        <option>Prefer not to say</option>
                    </select>
                </div>
            </div>

            <h5 class="text-xl font-semibold text-gray-700 border-b-2 border-blue-500 pb-2 mb-4 mt-8">
                Education & Skills
            </h5>

            <div class="mb-4">
                <label for="education" class="block text-gray-700 font-medium mb-1">
                    <i class="fas fa-graduation-cap text-blue-500 mr-2"></i>Current Education Level
                </label>
                <select class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" id="education" name="education" required>
                    <option value="">Select</option>
                    <option>10th Student</option>
                    <option>12th Student</option>
                    <option>Undergraduate (BTech/BSc/BCom/etc.)</option>
                    <option>Postgraduate (MTech/MBA/etc.)</option>
                    <option>Others</option>
                </select>
            </div>

            <div class="mb-4">
                <label for="subjects" class="block text-gray-700 font-medium mb-1">
                    <i class="fas fa-book text-blue-500 mr-2"></i>Favorite Subjects
                </label>
                <input type="text" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" id="subjects" name="subjects" placeholder="e.g., Maths, Biology, Programming, Arts, Accounts, etc.">
            </div>

            <div class="mb-4">
                <label class="block text-gray-700 font-medium mb-1">
                    <i class="fas fa-heart text-blue-500 mr-2"></i>Personal Interests / Hobbies
                </label>
                <div class="flex flex-wrap gap-4">
                    <div class="flex items-center">
                        <input class="form-checkbox h-4 w-4 text-blue-600 rounded" type="checkbox" value="Coding" id="hobbyCoding" name="hobbies">
                        <label class="ml-2 text-gray-700" for="hobbyCoding">Coding</label>
                    </div>
                    <div class="flex items-center">
                        <input class="form-checkbox h-4 w-4 text-blue-600 rounded" type="checkbox" value="Designing" id="hobbyDesigning" name="hobbies">
                        <label class="ml-2 text-gray-700" for="hobbyDesigning">Designing</label>
                    </div>
                    <div class="flex items-center">
                        <input class="form-checkbox h-4 w-4 text-blue-600 rounded" type="checkbox" value="Writing" id="hobbyWriting" name="hobbies">
                        <label class="ml-2 text-gray-700" for="hobbyWriting">Writing</label>
                    </div>
                    <div class="flex items-center">
                        <input class="form-checkbox h-4 w-4 text-blue-600 rounded" type="checkbox" value="Sports" id="hobbySports" name="hobbies">
                        <label class="ml-2 text-gray-700" for="hobbySports">Sports</label>
                    </div>
                    <div class="flex items-center">
                        <input class="form-checkbox h-4 w-4 text-blue-600 rounded" type="checkbox" value="Teaching" id="hobbyTeaching" name="hobbies">
                        <label class="ml-2 text-gray-700" for="hobbyTeaching">Teaching</label>
                    </div>
                </div>
            </div>

            <div class="mb-4">
                <label for="strengths" class="block text-gray-700 font-medium mb-1">
                    <i class="fas fa-thumbs-up text-blue-500 mr-2"></i>Strengths
                </label>
                <textarea class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" id="strengths" name="strengths" rows="3" placeholder="e.g., Analytical thinking, Creativity, Problem solving, Communication, etc."></textarea>
            </div>
            
            <div class="mb-4">
                <label for="weaknesses" class="block text-gray-700 font-medium mb-1">
                    <i class="fas fa-thumbs-down text-blue-500 mr-2"></i>Weaknesses (Optional)
                </label>
                <textarea class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" id="weaknesses" name="weaknesses" rows="2" placeholder="This helps in refining recommendations."></textarea>
            </div>

            <h5 class="text-xl font-semibold text-gray-700 border-b-2 border-blue-500 pb-2 mb-4 mt-8">
                Professional Profile
            </h5>

            <div class="mb-4">
                <label for="domains" class="block text-gray-700 font-medium mb-1">
                    <i class="fas fa-lightbulb text-blue-500 mr-2"></i>Interested Domains / Career Goals
                </label>
                <textarea class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" id="domains" name="domains" rows="3" placeholder="e.g., Data Science, Software Engineering, Marketing, Finance"></textarea>
            </div>

            <div class="mb-4">
                <label for="experience" class="block text-gray-700 font-medium mb-1">
                    <i class="fas fa-briefcase text-blue-500 mr-2"></i>Work Experience / Internships
                </label>
                <textarea class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" id="experience" name="experience" rows="4" placeholder="Describe your roles, responsibilities, and projects. If you have none, write 'N/A'."></textarea>
            </div>

            <div class="text-center mt-6">
                <button type="submit" class="w-full sm:w-auto px-6 py-3 bg-blue-600 text-white font-semibold rounded-full shadow-md hover:bg-blue-700 transition duration-300 transform hover:scale-105">
                    <i class="fas fa-paper-plane mr-2"></i>Generate Career Path
                </button>
            </div>
        </form>
    </div>
</body>
</html>
