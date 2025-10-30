# 🤖 CareerAI: AI Powered Career Guidance System

CareerAI is a full-stack web application designed to provide personalized and data-driven career recommendations to students and young professionals. Developed as a final project for Computer Engineering, this system utilizes a unique **Two-Phase Hybrid AI Output Strategy** to ensure high-quality, contextualized guidance.

---

## ✨ Project Overview

The core function of CareerAI is to analyze a user's detailed profile (skills, interests, and academic background) and suggest the most suitable career path.

### The Hybrid AI Output Strategy

The system is built on a two-phase process that strategically combines an internal classification model with an external contextual generator:

1.  **Phase 1: Classification (Local ML Model)**
    * **Action:** The system processes the user's 10-factor profile data (from the Candidate model) through an **internal Machine Learning model**.
    * **Output:** Generates the precise **Career Title** (e.g., "Graphic Designer" or "Data Scientist").
2.  **Phase 2: Context Generation (External Service)**
    * **Action:** The classified Career Title and the detailed profile are securely sent to an integrated **Contextual Rationale Generator** (an external LLM service).
    * **Output:** Returns a professional, detailed **justification** explaining *why* the classified role is an ideal fit, linking the user's skills and education to the role's requirements.

---

## ⚙️ Technical Stack and Architecture

CareerAI is built on a stable, three-tier MVC architecture, demonstrating proficiency in both enterprise backend development and modern frontend tooling.

### Backend and Logic

| Component | Technology/Tool | Role |
| :--- | :--- | :--- |
| **Server Language** | Java (JDK 22) | Core business logic, data persistence, and service orchestration. |
| **Server/Framework** | Java Servlets (Jakarta EE 6.0) | Manages application flow, state (HttpSession), and authentication. |
| **Data Persistence** | MySQL 8.0 (via JDBC) | Securely stores user credentials and the 10-factor candidate profile. |
| **API Integration** | OkHttp & `org.json` | Manages secure, low-level network calls to the external Rationale Generator. |
| **Build Management** | **Maven** (`pom.xml`) | Manages all Java dependencies and the project build lifecycle. |

### Frontend and Styling

| Component | Technology/Tool | Role |
| :--- | :--- | :--- |
| **Presentation** | JSP, HTML5, JavaScript | Renders views and handles client-side interactivity. |
| **Styling** | **Tailwind CSS 3.x** | Utility-first framework for a fully responsive design. |
| **Aesthetics** | Custom CSS pipeline (npm scripts) | Implements modern effects like **Glassmorphism** and dynamic CSS animations for enhanced UX. |

---

## 🛠️ Setup and Local Development

### Prerequisites

You need the following software installed:

1.  **Java Development Kit (JDK) 22**
2.  **Apache Tomcat v10.1** (or compatible Servlet container)
3.  **MySQL Server 8.0**
4.  **Maven** and **Node.js & npm**

### Setup Steps

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/Mobasheera/CareerAI/
    cd CareerAI
    ```

2.  **Configure Database:**
    * Create a MySQL database (e.g., `career_ai`).
    * Update the credentials in `src/main/java/com/careerai/util/DBConnection.java`.
    * *(You must run the initial SQL scripts to create the `users` and `candidate_profiles` tables.)*

3.  **Install Java Dependencies:**
    ```bash
    mvn clean install
    ```

4.  **Install Frontend Build Tools (Tailwind):**
    ```bash
    npm install
    ```

5.  **Configure Environment Variable (Crucial for Phase 2 Security):**
    * The Java servlet securely retrieves the API key. You must set this variable locally:
        *Set an environment variable named:* `OPENAI_API_KEY`

6.  **Run Tailwind Production Build:**
    * This compiles and minifies the final CSS for optimal performance:
        ```bash
        npm run build-css-prod
        ```

7.  **Deployment:**
    * Deploy the generated WAR file onto your **Apache Tomcat 10.1** server.

---

## 🤝 Contribution and Contact

This project was developed by a team of Mumbai University Computer Engineering students.

We welcome feedback and suggestions for improvement!

Feel free to open an issue if you encounter any bugs or have suggestions.
