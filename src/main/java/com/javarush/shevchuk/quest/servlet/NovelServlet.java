package com.javarush.shevchuk.quest.servlet;

import com.javarush.shevchuk.quest.model.GameState;
import com.javarush.shevchuk.quest.service.NovelService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/novel")
public class NovelServlet extends HttpServlet {
    private NovelService novelService = new NovelService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GameState gameState = (GameState) req.getSession().getAttribute("gameState");
        if (gameState == null || gameState.isGameOver()) {
            resp.sendRedirect(req.getContextPath() + "/start");
            return;
        }

        int sceneId = gameState.getCurrentSceneId();
        String sceneDescription = novelService.getSceneDescription(sceneId, gameState.getPlayerName());
        req.setAttribute("sceneDescription", sceneDescription);
        req.setAttribute("sceneId", sceneId);
        req.getRequestDispatcher("/WEB-INF/views/scene.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GameState gameState = (GameState) req.getSession().getAttribute("gameState");
        if (gameState == null || gameState.isGameOver()) {
            resp.sendRedirect(req.getContextPath() + "/start");
            return;
        }

        String choice = req.getParameter("choice");
        int nextSceneId = novelService.processChoice(gameState.getCurrentSceneId(), choice);
        gameState.setCurrentSceneId(nextSceneId);

        if (nextSceneId == 6 || nextSceneId == 7 || nextSceneId == 8) { // Сцены с окончанием игры
            gameState.setGameOver(true);
            String result = novelService.getSceneDescription(nextSceneId, gameState.getPlayerName());
            req.getSession().setAttribute("result", result);
            req.getSession().setAttribute("isWin", nextSceneId == 8);
            req.getSession().setAttribute("isWin", nextSceneId == 5);// Флаг победы// Сохраняем sceneId в сессии
            resp.sendRedirect(req.getContextPath() + "/end");
        } else {
            resp.sendRedirect(req.getContextPath() + "/novel");
        }
    }
}