<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Game Over</title>
    <!-- Подключение Bootstrap -->
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
        <c:choose>

        <c:when test="${sessionScope.sceneId == 6}">
            background-image: url('${pageContext.request.contextPath}/images/ovrag.jpg');
        </c:when>
        <c:when test="${sessionScope.sceneId == 7}">
            background-image: url('${pageContext.request.contextPath}/images/wolf.jpg');
        </c:when>
        <c:when test="${sessionScope.sceneId == 8}">
            background-image: url('${pageContext.request.contextPath}/images/morning forest2.jpg');
        </c:when>
        </c:choose>
        }

        .bottom-container {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background-color: rgba(0, 0, 0, 0.8); /* Чёрный полупрозрачный фон */
            padding: 20px;
            text-align: center;
        }

        .top-right {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: rgba(0, 0, 0, 0.8); /* Чёрный полупрозрачный фон */
            padding: 10px 20px;
            border-radius: 5px;
            color: white; /* Белый текст */
        }

        .custom-btn {
            background-color: transparent; /* Прозрачный фон */
            border: 2px solid #FFD700; /* Золотистая рамка */
            color: #FFD700; /* Золотистый текст */
            padding: 10px 20px;
            margin: 5px;
            border-radius: 5px;
            transition: all 0.3s ease;
            font-size: 16px; /* Размер текста на кнопках */
        }

        .custom-btn:hover {
            background-color: #FFD700; /* Золотистый фон при наведении */
            color: black; /* Чёрный текст при наведении */
        }
    </style>
</head>
<body>
<!-- Блок с именем и номером сессии -->
<div class="top-right">
    <p class="fs-5">Имя: ${sessionScope.gameState.playerName}</p>
    <p class="fs-5">Сессия: ${pageContext.session.id}</p>
</div>

<!-- Контейнер для текста и кнопки -->
<div class="bottom-container">
    <h1 class="text-white fs-3">${sessionScope.result}</h1>
    <a href="${pageContext.request.contextPath}/start" class="custom-btn fs-5">Play Again</a>
</div>
</body>
</html>