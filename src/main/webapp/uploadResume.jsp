<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Upload Resume</title>
</head>
<body>
    <h2>Upload Your Resume</h2>
    <form action="uploadResume" method="post" enctype="multipart/form-data">
        <input type="file" name="resume" accept=".pdf,.doc,.docx" required><br><br>
        <input type="submit" value="Upload">
    </form>
</body>
</html>
