package novel.service;


import com.javarush.shevchuk.quest.service.NovelService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class NovelServiceTest {

    private NovelService novelService;

    @BeforeEach
    public void setUp() {
        novelService = new NovelService();
    }

    @Test
    public void testGetSceneDescription() {
        // Проверяем описание для сцены 1
        String description = novelService.getSceneDescription(1, "Alice");
        assertEquals("Вы проснулись от тихого шёпота: \"Проснись Alice, проснись, ПРОСНИСЬ\". " +
                "Вы оказались на поляне посреди ночного леса. Осмотревшись, вы приметили узкую тропу которая уходит в густую чащу." +
                "Вам предстоит выбор: Остаться на поляне и дождаться утра, либо же, пойти по тропинке в лес, как поступите?", description);

        // Проверяем описание для сцены 2
        description = novelService.getSceneDescription(2, "Bob");
        assertEquals("Bob, вы пошли по тропинке и вышли к проклятому старому дому с заколоченными окнами и мраком царящим извечно в нём." +
                "Вы слышите какие-то полурычащие открывки фраз доносящиеся из дома: \"МНЕ БОЛЬНО ВИДЕТЬ БЕЛЫЙ СВЕТ...МЕЧТАЮ ТОЛЬКО О ЕДЕ...ПРОГРЫЗТЬ СВОЙ ВЕТХИЙ СТАРЫЙ ДОМ \"." +
                "Вы понимаете что дом может оказаться хорошим укрытием, но также понимаете что нечто в доме несёт опасность, как поступите ?", description);

        // Проверяем описание для несуществующей сцены
        description = novelService.getSceneDescription(999, "Charlie");
        assertEquals("Сцена не найдена.", description);
    }

    @Test
    public void testProcessChoice() {
        // Проверяем выбор "налево" на сцене 1
        int nextSceneId = novelService.processChoice(1, "left");
        assertEquals(2, nextSceneId);

        // Проверяем выбор "направо" на сцене 1
        nextSceneId = novelService.processChoice(1, "right");
        assertEquals(7, nextSceneId);

        // Проверяем выбор "войти в дом" на сцене 2
        nextSceneId = novelService.processChoice(2, "enter");
        assertEquals(3, nextSceneId);

        // Проверяем выбор "пройти мимо" на сцене 2
        nextSceneId = novelService.processChoice(2, "pass");
        assertEquals(4, nextSceneId);

        // Проверяем неверный выбор (должен вернуть текущую сцену)
        nextSceneId = novelService.processChoice(1, "invalid");
        assertEquals(1, nextSceneId);
    }
}