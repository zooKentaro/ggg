class StartScene extends Scene {
    @Override
    public void setup() {
        //
    }

    @Override
    public void draw(Game g) {
        fill(0);
        text("現在スタートシーンです", Config.SCREEN_WIDTH / 2, Config.SCREEN_HEIGHT / 2);
        if (g.key.enter) g.changeScene(SceneNum.MAIN);
    }
}
