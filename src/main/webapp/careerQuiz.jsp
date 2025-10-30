<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Career Discovery Quiz</title>
  <link href="css/output.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap');
    body {
      font-family: 'Inter', sans-serif;
      background: linear-gradient(to right, #667eea, #764ba2);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 1rem;
    }
  </style>
</head>
<body>

  <div id="quiz-container" class="bg-white p-8 md:p-12 rounded-2xl shadow-2xl max-w-xl w-full transition-all duration-500 ease-in-out">
    
    <!-- Start Screen -->
    <div id="start-screen" class="text-center">
      <h1 class="text-3xl md:text-4xl font-extrabold text-gray-900 mb-4">🚀 Career Compass Quiz</h1>
      <p class="text-gray-600 mb-8 text-lg md:text-xl">Answer a few questions to discover your ideal career path based on your personality and strengths.</p>
      <button onclick="startQuiz()" 
        class="bg-blue-600 text-white font-semibold py-3 px-8 rounded-full shadow-lg hover:bg-blue-700 transform hover:scale-105 transition">
        Start Quiz
      </button>
    </div>

    <!-- Quiz Questions -->
    <div id="quiz-questions" class="hidden">
      <!-- Progress Bar -->
      <div class="w-full bg-gray-200 rounded-full h-3 mb-6 overflow-hidden">
        <div id="progress-bar" class="h-3 bg-blue-600 rounded-full transition-all duration-300 ease-in-out" style="width:0%"></div>
      </div>

      <p id="question-text" class="text-xl md:text-2xl font-bold text-gray-800 mb-6"></p>
      <div id="options-container" class="space-y-4"></div>
      <p id="question-counter" class="text-sm text-gray-500 mt-6 text-center"></p>
    </div>

    <!-- Results Screen -->
    <div id="results-screen" class="hidden text-center">
      <h2 class="text-2xl md:text-3xl font-bold text-gray-900 mb-2">🎯 Your Career Path</h2>
      <h3 id="result-career" class="text-2xl md:text-3xl font-extrabold text-blue-600 mb-4"></h3>
      <p id="result-description" class="text-gray-600 mb-6 text-md md:text-lg leading-relaxed text-left"></p>
      
      <div class="bg-gray-50 p-4 rounded-xl shadow-inner mb-6">
        <canvas id="score-chart" class="max-h-64"></canvas>
      </div>

      <button onclick="restartQuiz()" 
        class="bg-gray-600 text-white font-semibold py-3 px-8 rounded-full shadow-lg hover:bg-gray-700 transform hover:scale-105 transition">
        🔄 Retake Quiz
      </button>
    </div>

  </div>

  <script>
    // Questions
    const questions = [
      { question: "Imagine you're leading a new project. What's your first step?",
        options: [
          { text: "Create a detailed plan and analyze risks.", category: "analytical" },
          { text: "Brainstorm creative and unconventional ideas.", category: "creative" },
          { text: "Delegate tasks based on team strengths.", category: "social" },
          { text: "Check available tools and resources.", category: "technical" }
        ]
      },
      { question: "What kind of book or podcast would you choose for a trip?",
        options: [
          { text: "A scientific study or mystery novel.", category: "analytical" },
          { text: "A biography of an artist or storytelling podcast.", category: "creative" },
          { text: "Personal development or psychology show.", category: "social" },
          { text: "Engineering or gadget show.", category: "technical" }
        ]
      },
      { question: "When faced with a tough problem, how do you prefer to solve it?",
        options: [
          { text: "By logical analysis and structured thinking.", category: "analytical" },
          { text: "By thinking outside the box and innovating.", category: "creative" },
          { text: "By discussing with peers and brainstorming.", category: "social" },
          { text: "By experimenting with tools or code.", category: "technical" }
        ]
      },
      { question: "On a free weekend, you'd rather...",
        options: [
          { text: "Work on puzzles or analytical games.", category: "analytical" },
          { text: "Paint, write, or do something artistic.", category: "creative" },
          { text: "Hang out with friends or help a group.", category: "social" },
          { text: "Build or repair something.", category: "technical" }
        ]
      },
      { question: "What energizes you most in conversations?",
        options: [
          { text: "Debating facts and data.", category: "analytical" },
          { text: "Sharing fresh and creative ideas.", category: "creative" },
          { text: "Listening and advising others.", category: "social" },
          { text: "Explaining how systems or machines work.", category: "technical" }
        ]
      },
      { question: "In a team project, you're usually the one who...",
        options: [
          { text: "Organizes tasks and ensures deadlines.", category: "analytical" },
          { text: "Designs presentations and creative assets.", category: "creative" },
          { text: "Motivates and mediates among members.", category: "social" },
          { text: "Handles technical setups or troubleshooting.", category: "technical" }
        ]
      },
      { question: "Which phrase resonates with you most?",
        options: [
          { text: "Work smarter, not harder.", category: "analytical" },
          { text: "The blank canvas is full of possibilities.", category: "creative" },
          { text: "People make the journey worthwhile.", category: "social" },
          { text: "Show me how it works.", category: "technical" }
        ]
      },
      { question: "When learning something new, you prefer to...",
        options: [
          { text: "Read research articles or documentation.", category: "analytical" },
          { text: "Experiment and learn through trial and error.", category: "creative" },
          { text: "Join a workshop or discussion group.", category: "social" },
          { text: "Watch technical tutorials and practice.", category: "technical" }
        ]
      },
      { question: "Your dream vacation would be...",
        options: [
          { text: "Exploring museums or history tours.", category: "analytical" },
          { text: "Going to an art/music festival.", category: "creative" },
          { text: "Traveling with close friends/family.", category: "social" },
          { text: "Exploring futuristic cities or transport systems.", category: "technical" }
        ]
      },
      { question: "If you started a side business, it would be...",
        options: [
          { text: "A finance or consulting service.", category: "analytical" },
          { text: "A blog, art shop, or design studio.", category: "creative" },
          { text: "A non-profit or community service.", category: "social" },
          { text: "A repair/tech support or gadget business.", category: "technical" }
        ]
      }
    ];

    // Career Results with detailed roadmap
    const careers = {
      analytical: {
        title: "Analytical & Problem-Solving Careers",
        description: `
          You have strong logical and reasoning skills.  
          <br><br><b>Suggested Paths:</b>  
          • Data Scientist / Analyst  
          • Financial Analyst / Economist  
          • Research Scientist  
          • Software Developer (Backend / AI)  
          <br><br><b>Roadmap:</b>  
          1. Strengthen math, statistics, and logic.  
          2. Learn Python, R, SQL, Excel.  
          3. Do internships in finance or data.  
          4. Build projects in ML/data visualization.  
        `
      },
      creative: {
        title: "Creative & Innovative Careers",
        description: `
          You thrive in imagination and expression.  
          <br><br><b>Suggested Paths:</b>  
          • Graphic Designer / UI-UX Designer  
          • Content Writer / Blogger  
          • Filmmaker / Animator  
          • Architect  
          <br><br><b>Roadmap:</b>  
          1. Learn design tools (Photoshop, Figma).  
          2. Build a portfolio/blog.  
          3. Network with creative professionals.  
          4. Take freelance or project gigs.  
        `
      },
      social: {
        title: "People-Oriented & Social Careers",
        description: `
          You excel in communication and empathy.  
          <br><br><b>Suggested Paths:</b>  
          • Teacher / Educator  
          • Psychologist / Counselor  
          • HR Manager  
          • Social Worker  
          <br><br><b>Roadmap:</b>  
          1. Build soft skills (empathy, leadership).  
          2. Volunteer in teaching/mentoring.  
          3. Take certifications in psychology or HR.  
          4. Grow a strong network.  
        `
      },
      technical: {
        title: "Technical & Engineering Careers",
        description: `
          You enjoy building and experimenting.  
          <br><br><b>Suggested Paths:</b>  
          • Software Engineer / IT Specialist  
          • Mechanical / Electrical Engineer  
          • Cybersecurity Specialist  
          • Robotics Developer  
          <br><br><b>Roadmap:</b>  
          1. Learn coding or engineering basics.  
          2. Work on DIY projects or robotics kits.  
          3. Get internships in tech/engineering.  
          4. Join open-source communities.  
        `
      }
    };

    // State
    let currentQuestionIndex = 0;
    let scores = { analytical: 0, creative: 0, social: 0, technical: 0 };
    let scoreChartInstance = null;

    // Elements
    const startScreen = document.getElementById('start-screen');
    const quizQuestions = document.getElementById('quiz-questions');
    const resultsScreen = document.getElementById('results-screen');
    const questionText = document.getElementById('question-text');
    const optionsContainer = document.getElementById('options-container');
    const questionCounter = document.getElementById('question-counter');
    const resultCareer = document.getElementById('result-career');
    const resultDescription = document.getElementById('result-description');
    const progressBar = document.getElementById('progress-bar');

    function startQuiz() {
      startScreen.classList.add('hidden');
      quizQuestions.classList.remove('hidden');
      displayQuestion();
    }

    function displayQuestion() {
      if (currentQuestionIndex < questions.length) {
        const q = questions[currentQuestionIndex];
        questionText.textContent = q.question;
        optionsContainer.innerHTML = '';
        q.options.forEach(option => {
          const button = document.createElement('button');
          button.textContent = option.text;
          button.className = "w-full bg-white border border-gray-300 text-gray-700 text-lg font-medium py-4 px-6 rounded-xl shadow-sm hover:bg-blue-50 hover:border-blue-400 hover:text-blue-700 transition";
          button.onclick = () => selectOption(option.category);
          optionsContainer.appendChild(button);
        });
        questionCounter.textContent = `Question ${currentQuestionIndex + 1} of ${questions.length}`;
        progressBar.style.width = `${((currentQuestionIndex) / questions.length) * 100}%`;
      } else {
        showResults();
      }
    }

    function selectOption(category) {
      scores[category]++;
      currentQuestionIndex++;
      displayQuestion();
    }

    function showResults() {
      quizQuestions.classList.add('hidden');
      resultsScreen.classList.remove('hidden');

      let maxScore = 0;
      let recommendedCareer = "analytical";
      for (const category in scores) {
        if (scores[category] > maxScore) {
          maxScore = scores[category];
          recommendedCareer = category;
        }
      }

      const careerInfo = careers[recommendedCareer];
      resultCareer.textContent = careerInfo.title;
      resultDescription.innerHTML = careerInfo.description;

      renderChart();
    }

    function renderChart() {
      if (scoreChartInstance) scoreChartInstance.destroy();
      const ctx = document.getElementById('score-chart').getContext('2d');
      scoreChartInstance = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ['Analytical', 'Creative', 'Social', 'Technical'],
          datasets: [{
            label: 'Your Profile',
            data: [scores.analytical, scores.creative, scores.social, scores.technical],
            backgroundColor: ['#3B82F6', '#F97316', '#10B981', '#9333EA']
          }]
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          scales: { y: { beginAtZero: true } },
          plugins: { legend: { display: false } }
        }
      });
    }

    function restartQuiz() {
      currentQuestionIndex = 0;
      scores = { analytical: 0, creative: 0, social: 0, technical: 0 };
      resultsScreen.classList.add('hidden');
      startScreen.classList.remove('hidden');
      progressBar.style.width = "0%";
    }
  </script>
</body>
</html>
