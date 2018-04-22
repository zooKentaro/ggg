class MainScene extends Scene {
    @Override
    public void setup() {
        game.spawn(new Player1(game.config.SCREEN_WIDTH / 2, game.config.SCREEN_HEIGHT / 2));
        game.spawn(new Player2(game.config.SCREEN_WIDTH / 2, game.config.SCREEN_HEIGHT / 3));
    }

    @Override
    public void draw() {
        // 背景描画
        fill(220, 255, 220);
        rect(game.config.FIELD_X, game.config.FIELD_Y, game.config.FIELD_WIDTH, game.config.FIELD_HEIGHT);

        // 有効なオブジェクトのdraw()を毎フレーム呼び出す
        for (int i = 0; i < game.objects.length; i++) {
            // null の場合はその場で終了
            if (game.objects[i] == null) {
                continue;
            }
            if (game.objects[i].is_alive == true) {
                // オブジェクト描画
                game.objects[i].run();
                // 当たり判定
                for (int j = 0; j < game.objects.length; j++) {
                    // null の場合はその場で終了
                    if (game.objects[j] == null) {
                        continue;
                    }
                    // 当たっているかどうかを調べる
                    game.objects[i].checkHitting(game.objects[j]);
                }
            }
        }
    }
}
