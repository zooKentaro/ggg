class SceneClear extends Scene {
    @Override
    public void setup() {
        //
    }

    @Override
    public void draw() {
        fill(0);
        text("現在クリアシーンです", game.config.SCREEN_WIDTH / 2, game.config.SCREEN_HEIGHT / 2);
    }
}
