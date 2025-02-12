<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Scene</title>
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
        <c:when test="${sceneId == 1}">
            background-image: url('${pageContext.request.contextPath}/images/forest.jpg');
        </c:when>
        <c:when test="${sceneId == 2}">
            background-image: url('${pageContext.request.contextPath}/images/house.jpg');
        </c:when>
        <c:when test="${sceneId == 3}">
            background-image: url('${pageContext.request.contextPath}/images/morning forest.jpg');
        </c:when>
        <c:when test="${sceneId == 4}">
            background-image: url('${pageContext.request.contextPath}/images/wolf dog.jpg');
        </c:when>
        <c:when test="${sceneId == 5}">
            background-image: url('${pageContext.request.contextPath}/images/taksa.jpg');
        </c:when>
        <c:when test="${sceneId == 6}">
            background-image: url('${pageContext.request.contextPath}/images/ovrag.jpg');
        </c:when>
        <c:when test="${sceneId == 7}">
            background-image: url('${pageContext.request.contextPath}/images/wolf.jpg');
        </c:when>
        <c:when test="${sceneId == 8}">
            background-image: url('${pageContext.request.contextPath}/images/morning forest.jpg');
        </c:when>
        </c:choose>
        }

        .bottom-container {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background-color: rgba(0, 0, 0, 0.8); /* Чёрный полупрозрачный фон */
            padding: 10px;
            text-align: center;
            /*height: 100px;*/
            font-size: 15px;
        }

        .top-right {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: rgba(0, 0, 0, 0.8); /* Чёрный полупрозрачный фон */
            padding: 10px 20px;
            border-radius: 5px;
            color: white; /* Белый текст */
            height: 80px;
            font-size: 15px;
        }

        .custom-btn {
            background-color: transparent; /* Прозрачный фон */
            border: 2px solid #FFD700; /* Золотистая рамка */
            color: #FFD700; /* Золотистый текст */
            padding: 10px 20px;
            margin: 5px;
            border-radius: 5px;
            transition: all 0.3s ease;
            font-size: 15px;
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
    <p>Имя: ${gameState.playerName}</p>
    <p>Сессия: ${pageContext.session.id}</p>
</div>

<!-- Контейнер для текста и кнопок -->
<div class="bottom-container">
    <h1 class="text-white fs-5">${sceneDescription}</h1>
    <form action="${pageContext.request.contextPath}/novel" method="post">
        <c:if test="${sceneId == 1}">
            <button type="submit" name="choice" value="left" class="custom-btn">Налево</button>
            <button type="submit" name="choice" value="right" class="custom-btn">Направо</button>
        </c:if>
        <c:if test="${sceneId == 2}">
            <button type="submit" name="choice" value="enter" class="custom-btn">Войти в дом</button>
            <button type="submit" name="choice" value="pass" class="custom-btn">Пройти мимо</button>
        </c:if>
        <c:if test="${sceneId == 4}">
            <button type="submit" name="choice" value="fight" class="custom-btn">Сразиться с волком</button>
            <button type="submit" name="choice" value="run" class="custom-btn">Убежать</button>
        </c:if>
        <c:if test="${sceneId == 3 || sceneId == 5}">
            <button type="submit" name="choice" value="continue" class="custom-btn">Продолжить путь</button>
        </c:if>
    </form>
</div>
</body>
</html>