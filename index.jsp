<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Spotify Clone</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background-color: #121212; color: white; }
        .container { display: flex; flex-wrap: wrap; padding: 20px; }
        .sidebar { width: 100%; max-width: 300px; background-color: #000; padding: 20px; border-radius: 10px; }
        .main { flex: 1; padding: 20px; }
        .header { background-color: #1DB954; padding: 20px; text-align: center; border-radius: 10px; margin-top: 20px; }
        .song-list, .artist-list { display: grid; grid-template-columns: repeat(auto-fill, minmax(150px, 1fr)); gap: 20px; margin-top: 20px; }
        .song, .artist { background-color: #282828; border-radius: 10px; padding: 10px; text-align: center; cursor: pointer; }
        .song:hover, .artist:hover { background-color: #383838; }
        .controls { position: fixed; bottom: 0; width: 100%; background-color: #1DB954; padding: 10px; text-align: center; }
        audio { width: 100%; }
        .playlist-btn { background-color: #1DB954; padding: 10px; border-radius: 10px; text-align: center; cursor: pointer; margin-top: 10px; }
        .playlist-btn:hover { background-color: #1ed760; }

        .top-right { position: absolute; top: 10px; right: 10px; }
        .top-right button { background-color: #1DB954; padding: 10px 20px; border: none; border-radius: 5px; color: white; cursor: pointer; }
        .top-right button:hover { background-color: #1ed760; }

        @media (max-width: 768px) {
            .container { flex-direction: column; }
            .sidebar { width: 100%; }
            .main { width: 100%; }
        }
    </style>
</head>
<body>
    <%@ page import="jakarta.servlet.http.HttpSession" %>

    <div class="top-right">
        <%
            HttpSession userSession = request.getSession(false);
            String username = (userSession != null) ? (String) userSession.getAttribute("username") : null;
            if (username != null && !username.isEmpty()) {
        %>
            <button> <%= username %> </button>
        <%
            } else {
        %>
            <button onclick="window.location.href='login.jsp'">Login</button>
        <%
            }
        %>
    </div>

    <div class="container">
        <div class="sidebar">
            <h2>Your Library</h2>
            <div class="playlist-btn">Create Playlist</div>
        </div>
        <div class="main">
            <div class="header">
                <h1>Trending Songs</h1>
            </div>
            <div class="song-list">
                <div class="song" data-file="song1.mp3">2 Khatole</div>
                <div class="song" data-file="song2.mp3">Premalo (From "Court")</div>
                <div class="song" data-file="song3.mp3">Raanjhan (From "Do Patti")</div>
                <div class="song" data-file="song4.mp3">Finding Her</div>
                <div class="song" data-file="song5.mp3">Paro</div>
            </div>
            <div class="header">
                <h1>Popular Artists</h1>
            </div>
            <div class="artist-list">
                <div class="artist">Arijit Singh</div>
                <div class="artist">Neha Kakkar</div>
                <div class="artist">Jubin Nautiyal</div>
                <div class="artist">Badshah</div>
                <div class="artist">Shreya Ghoshal</div>
            </div>
        </div>
    </div>
    <div class="controls">
        <audio id="audio" controls></audio>
    </div>

    <script>
        const songs = document.querySelectorAll('.song');
        const audio = document.getElementById('audio');

        songs.forEach(song => {
            song.addEventListener('click', () => {
                const file = song.getAttribute('data-file');
                audio.src = file;
                audio.play();
            });
        });
    </script>
</body>
</html>
