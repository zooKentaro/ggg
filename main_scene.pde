class MainScene extends Scene {
    @Override
    public void setup(Game g) {
        g.spawn(new Player(Config.SCREEN_WIDTH / 2, Config.SCREEN_HEIGHT / 2));
    }

    @Override
    public void draw(Game g) {
        // 有効なオブジェクトのdraw()を毎フレーム呼び出す
        for (int i = 0; i < g.objects.length; i++) {
            if (g.objects[i] != null && g.objects[i].is_alive == true) {
                g.objects[i].draw(g);
            }
        }
    }
}
