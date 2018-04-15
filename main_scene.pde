class MainScene extends Scene {
    @Override
    public void setup(Game g) {
        g.spawn(new Player(Config.SCREEN_WIDTH / 2, Config.SCREEN_HEIGHT / 2));
        g.spawn(new Player2(Config.SCREEN_WIDTH / 2, Config.SCREEN_HEIGHT / 3));
        g.spawn(new Enemy(Config.SCREEN_WIDTH, Config.SCREEN_HEIGHT / 2));
    }

    @Override
    public void draw(Game g) {
        // 有効なオブジェクトのdraw()を毎フレーム呼び出す
        for (int i = 0; i < g.objects.length; i++) {
            // null の場合はその場で終了
            if (g.objects[i] == null) {
                break;
            }
            if (g.objects[i].is_alive == true) {
                // オブジェクト描画
                g.objects[i].draw(g);
                // 当たり判定
                for (int j = 0; j < g.objects.length; j++) {
                    // null の場合はその場で終了
                    if (g.objects[j] == null) {
                        break;
                    }
                    // 当たっているかどうかを調べる
                    g.objects[i].checkHitting(g.objects[j]);
                }
            }
        }
    }
}
