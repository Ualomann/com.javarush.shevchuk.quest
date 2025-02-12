<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Start Game</title>
    <!-- Подключение Bootstrap -->
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
            background-image: url('${pageContext.request.contextPath}/images/forest welcome.jpg'); /* Фоновая картинка */
        }

        .center-container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: rgba(0, 0, 0, 0.8); /* Чёрный полупрозрачный фон */
            padding: 20px;
            text-align: center;
            border-radius: 10px;
        }

        .custom-btn {
            background-color: transparent; /* Прозрачный фон */
            border: 2px solid #FFD700; /* Золотистая рамка */
            color: #FFD700; /* Золотистый текст */
            padding: 10px 20px;
            margin: 10px;
            border-radius: 5px;
            transition: all 0.3s ease;
            font-size: 16px; /* Размер текста на кнопках */
        }

        .custom-btn:hover {
            background-color: #FFD700; /* Золотистый фон при наведении */
            color: black; /* Чёрный текст при наведении */
        }

        h1 {
            font-size: 24px; /* Размер заголовка */
            color: white; /* Белый текст */
        }

        p {
            font-size: 18px; /* Размер текста */
            color: white; /* Белый текст */
        }
    </style>
</head>
<body>
<!-- Контейнер для текста и кнопки -->
<div class="center-container">
    <h1 class="fs-3">Вы проснулись среди ночи рядом с лесом, вы не помните как сюда попали.
        Ваша задача: выбраться из леса и вернуться домой</h1>
    <p class="fs-5">Введите своё имя:</p>
    <form action="${pageContext.request.contextPath}/start" method="post">
        <input type="text" name="playerName" class="form-control mb-3" placeholder="Your name" required>
        <button type="submit" class="custom-btn fs-5">Начать игру</button>
    </form>
</div>
</body>
</html>








