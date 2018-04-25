class SceneStart extends Scene {
    @Override
    public void setup() {
        //
    }

    @Override
    public void draw() {
        fill(0);
        text("現在スタートシーンです", game.config.SCREEN_WIDTH / 2, game.config.SCREEN_HEIGHT / 2);
        if (game.key.enter) game.changeScene(SceneNum.MAIN);
    }
}
