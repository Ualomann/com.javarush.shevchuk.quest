package com.javarush.shevchuk.quest.model;


public class GameState {
    private String playerName;
    private int currentSceneId;
    private boolean gameOver;

    public GameState(String playerName) {
        this.playerName = playerName;
        this.currentSceneId = 1; // Начинаем с первой сцены
        this.gameOver = false;
    }

    public String getPlayerName() { return playerName; }
    public int getCurrentSceneId() { return currentSceneId; }
    public void setCurrentSceneId(int currentSceneId) { this.currentSceneId = currentSceneId; }
    public boolean isGameOver() { return gameOver; }
    public void setGameOver(boolean gameOver) { this.gameOver = gameOver; }
}