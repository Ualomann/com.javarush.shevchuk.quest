package com.javarush.shevchuk.quest.servlet;

import com.javarush.shevchuk.quest.model.GameState;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/end")
public class EndServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Получаем результат игры из сессии
        String result = (String) req.getSession().getAttribute("result");
        req.setAttribute("result", result); // Передаём результат в JSP
        req.getRequestDispatcher("/WEB-INF/views/end.jsp").forward(req, resp);

        GameState gameState = (GameState) req.getSession().getAttribute("gameState");
        int sceneId = gameState.getCurrentSceneId();
    }
}