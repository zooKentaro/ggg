class OverScene extends Scene {
    @Override
    public void setup() {
        //
    }

    @Override
    public void draw() {
        fill(0);
        text("現在ゲームオーバーシーンです", game.config.SCREEN_WIDTH / 2, game.config.SCREEN_HEIGHT / 2);
    }
}
