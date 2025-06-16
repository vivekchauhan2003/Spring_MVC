<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Alien Result</title>

    <!-- Link Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            margin: 50px;
            color: #333;
        }

        .result-box {
            width: 800px;
            margin: 0 auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center;
        }

        h2 {
            margin: 15px 0;
        }

        hr {
            margin: 30px 0;
        }
    </style>
</head>
<body>
<div class="result-box">
    <h2>Alien ID: ${alien.aid}</h2>
    <h2>Alien Name: ${alien.aname}</h2>
    <hr>
    <h2>${alien.aname} is enrolled in: ${course}</h2>
</div>
</body>
</html>
