class OverScene extends Scene {
    @Override
    public void setup(Game g) {
        //
    }

    @Override
    public void draw(Game g) {
        fill(0);
        text("現在ゲームオーバーシーンです", Config.SCREEN_WIDTH / 2, Config.SCREEN_HEIGHT / 2);
    }
}
