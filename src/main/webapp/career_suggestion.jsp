<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Career AI - Get Suggestions</title>
    <link href="css/output.css" rel="stylesheet">
</head>
<body class="bg-gray-100 flex justify-center items-center min-h-screen">
<div class="bg-white p-8 rounded-xl shadow-md w-full max-w-lg">
    <h1 class="text-2xl font-bold text-center text-blue-600">Career AI - Suggestions</h1>
    <p class="text-gray-500 text-center mt-1 mb-6">Tell us a bit about yourself to get tailored career ideas.</p>

    <form action="CareerSuggestionServlet" method="post" class="space-y-5" id="career-form">
        <div>
            <label class="block mb-1 font-semibold" for="education">Education</label>
            <textarea id="education" name="education" class="w-full border border-gray-300 focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition rounded p-3 placeholder-gray-400" rows="3" maxlength="400" placeholder="e.g., B.Sc. in Computer Science, 2024, key coursework: Data Structures, DBMS"></textarea>
            <div class="flex items-center justify-between mt-1 text-xs text-gray-500">
                <span>Include degree, year, notable coursework.</span>
                <span><span id="education-count">0</span>/400</span>
            </div>
        </div>

        <div>
            <label class="block mb-1 font-semibold" for="skills">Skills</label>
            <textarea id="skills" name="skills" class="w-full border border-gray-300 focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition rounded p-3 placeholder-gray-400" rows="3" maxlength="400" placeholder="e.g., Java, SQL, React, Data Analysis, Communication"></textarea>
            <div class="flex items-center justify-between mt-1 text-xs text-gray-500">
                <span>List technical and soft skills, comma-separated.</span>
                <span><span id="skills-count">0</span>/400</span>
            </div>
        </div>

        <div>
            <label class="block mb-1 font-semibold" for="interests">Interests</label>
            <textarea id="interests" name="interests" class="w-full border border-gray-300 focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition rounded p-3 placeholder-gray-400" rows="3" maxlength="400" placeholder="e.g., Fintech, AI ethics, building user-centric products"></textarea>
            <div class="flex items-center justify-between mt-1 text-xs text-gray-500">
                <span>What domains or problems excite you?</span>
                <span><span id="interests-count">0</span>/400</span>
            </div>
        </div>

        <div class="text-center">
            <button id="submit-btn" type="submit" class="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700 disabled:opacity-60 disabled:cursor-not-allowed">Get Career Suggestions</button>
        </div>
    </form>
</div>

<script>
    (function () {
        function bindCounter(id, counterId) {
            var el = document.getElementById(id);
            var counter = document.getElementById(counterId);
            if (!el || !counter) return;
            var update = function () { counter.textContent = String(el.value.length); };
            el.addEventListener('input', update);
            update();
        }
        bindCounter('education', 'education-count');
        bindCounter('skills', 'skills-count');
        bindCounter('interests', 'interests-count');

        var form = document.getElementById('career-form');
        var button = document.getElementById('submit-btn');
        if (form && button) {
            form.addEventListener('submit', function () {
                button.disabled = true;
                var original = button.textContent;
                button.setAttribute('data-original', original);
                button.textContent = 'Generating...';
            });
        }
    })();
</script>
</body>
</html>
