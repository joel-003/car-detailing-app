<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Something went wrong</title>
    <link rel="stylesheet" href="css/util.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .error-box {
            background: #fff;
            padding: 40px;
            border-radius: 14px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
            max-width: 420px;
        }
        h1 {
            color: #E9002D;
            margin-bottom: 10px;
        }
        p {
            color: #555;
            margin-bottom: 20px;
        }
        a {
            display: inline-block;
            padding: 12px 22px;
            background: #E9002D;
            color: #fff;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
        }
        a:hover {
            background: #b00022;
        }
    </style>
</head>
<body>

<div class="error-box">
    <h1>Oops!</h1>
    <p>Something went wrong on our side.<br>
        Please try again later.</p>
    <a href="index.jsp">Go Home</a>
</div>

</body>
</html>
