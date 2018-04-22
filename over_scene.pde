class OverScene extends Scene {
    @Override
    public void setup() {
        //
    }

    @Override
    public void draw() {
        fill(0);
        text("現在ゲームオーバーシーンです", Config.SCREEN_WIDTH / 2, Config.SCREEN_HEIGHT / 2);
    }
}
