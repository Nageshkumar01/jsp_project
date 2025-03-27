<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login and Registration Module</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap');
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { 
        background: linear-gradient(145deg, #1e293b, #334155);
        font-family: 'Poppins', sans-serif;
        padding: 20px; 
        color: #fff;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .container { 
        width: 400px; 
        background-color: rgba(255, 255, 255, 0.1);
        padding: 20px; 
        border-radius: 15px; 
        box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        backdrop-filter: blur(10px);
    }
    h2 { 
        text-align: center; 
        margin-bottom: 20px; 
        font-size: 32px;
        text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
    }
    input { 
        width: 100%; 
        padding: 12px; 
        margin: 10px 0; 
        border: none; 
        border-radius: 10px; 
        font-size: 18px;
        box-shadow: inset 0 2px 4px rgba(0,0,0,0.1);
    }
    button { 
        width: 100%; 
        padding: 12px; 
        background-color: #1DB954; 
        color: white; 
        border: none; 
        border-radius: 10px; 
        font-size: 20px;
        cursor: pointer; 
        transition: background-color 0.3s;
    }
    button:hover { 
        background-color: #1ed760; 
    }
    .message { 
        color: #ff726f; 
        text-align: center; 
        margin-top: 10px; 
        font-size: 18px;
    }
</style>
</head>
<body>
    <div class="container">
        <!-- Login Form -->
        <h2 id="form-title">Login</h2>
        <form method="post" action="process.jsp">
            <div id="name-field" style="display: none;">
                <input type="text" name="name" placeholder="Full Name">
            </div>
            <input type="text" name="username" placeholder="Username" required>
            <div id="email-field" style="display: none;">
                <input type="email" name="email" placeholder="Email">
            </div>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit" id="submit-btn">Login</button>
        </form>
        <p class="message" onclick="toggleForm()">Don't have an account? Sign up</p>
    </div>

    <script>
        let isSignup = false;

        function toggleForm() {
            isSignup = !isSignup;
            document.getElementById("form-title").textContent = isSignup ? "Sign Up" : "Login";
            document.getElementById("name-field").style.display = isSignup ? "block" : "none";
            document.getElementById("email-field").style.display = isSignup ? "block" : "none";
            document.getElementById("submit-btn").textContent = isSignup ? "Sign Up" : "Login";
            document.querySelector(".message").textContent = isSignup ? "Already have an account? Login" : "Don't have an account? Sign up";
        }
    </script>
</body>
</html>
