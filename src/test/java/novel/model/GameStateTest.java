package novel.model;

import com.javarush.shevchuk.quest.model.GameState;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class GameStateTest {

    private GameState gameState;

    @BeforeEach
    public void setUp() {
        gameState = new GameState("Alice");
    }

    @Test
    public void testInitialState() {
        assertEquals("Alice", gameState.getPlayerName());
        assertEquals(1, gameState.getCurrentSceneId());
        assertFalse(gameState.isGameOver());
    }

    @Test
    public void testSetCurrentSceneId() {
        gameState.setCurrentSceneId(5);
        assertEquals(5, gameState.getCurrentSceneId());
    }

    @Test
    public void testSetGameOver() {
        gameState.setGameOver(true);
        assertTrue(gameState.isGameOver());
    }
}