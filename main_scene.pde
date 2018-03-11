class MainScene extends Scene {
    @Override
    public void setup() {
        //
    }

    @Override
    public void draw(Game g) {
        fill(0);
        text("現在メインシーンです", Config.SCREEN_WIDTH / 2, Config.SCREEN_HEIGHT / 2);
    }
}
