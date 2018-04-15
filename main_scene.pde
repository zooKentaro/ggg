class MainScene extends Scene {
    @Override
    public void setup() {
        game.spawn(new Player(Config.SCREEN_WIDTH / 2, Config.SCREEN_HEIGHT / 2));
        game.spawn(new Player2(Config.SCREEN_WIDTH / 2, Config.SCREEN_HEIGHT / 3));
        game.spawn(new Enemy(Config.SCREEN_WIDTH, Config.SCREEN_HEIGHT / 2));
    }

    @Override
    public void draw() {
        // 有効なオブジェクトのdraw()を毎フレーム呼び出す
        for (int i = 0; i < game.objects.length; i++) {
            // null の場合はその場で終了
            if (game.objects[i] == null) {
                break;
            }
            if (game.objects[i].is_alive == true) {
                // オブジェクト描画
                game.objects[i].run();
                // 当たり判定
                for (int j = 0; j < game.objects.length; j++) {
                    // null の場合はその場で終了
                    if (game.objects[j] == null) {
                        break;
                    }
                    // 当たっているかどうかを調べる
                    game.objects[i].checkHitting(game.objects[j]);
                }
            }
        }
    }
}
