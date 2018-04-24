class SceneMain extends Scene {
    @Override
    public void setup() {
        game.spawn(new Player1(game.field.X(20) + 8, game.config.SCREEN_HEIGHT / 2));
        game.spawn(new Player2(game.field.X(1), game.config.SCREEN_HEIGHT / 2));
        setShields();
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
                // 当たり判定
                for (int j = 0; j < game.objects.length; j++) {
                    // null の場合はその場で終了
                    if (game.objects[j] == null) {
                        continue;
                    }
                    // 当たっているかどうかを調べる
                    game.objects[i].checkHitting(game.objects[j]);
                }
                // オブジェクト描画
                game.objects[i].run();
            }
        }
    }

    /**
     * シールドを展開する
     */
    protected void setShields() {
        int w = game.field.sectionW();
        int h = game.field.sectionH();
        int[] p1y = game.field.fieldY1List();

        // Player1のシールドを展開
        int x = game.field.X(2);
        for (int y = 0; y < p1y.length; y++) {
            game.spawn(new Shield(x, y * h));
        }

        // Player2のシールドを展開
        x = game.field.X(19);
        for (int y = 0; y < p1y.length; y++) {
            game.spawn(new Shield(x, y * h));
        }
    }
}
