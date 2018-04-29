class SceneMain extends Scene {

    @Override
    public void setup() {
        // 戦闘フィールドセットアップ
        game.field.setup();

        // シールド展開
        setShields();

        // プレイヤー設置
        game.spawn(new Player1(game.field.getX(20) + 8, game.config.SCREEN_HEIGHT / 2));
        game.spawn(new Player2(game.field.getX(1), game.config.SCREEN_HEIGHT / 2));

        // BGM再生
        Sound bgm = new Sound("bgm_main.mp3");
        bgm.loop();
    }

    @Override
    public void draw() {
        // 戦闘フィールド描画
        game.field.run();

        // 有効なオブジェクトのdraw()を毎フレーム呼び出す
        for (int i = 0; i < game.objects.length; i++) {
            // null の場合はその場で終了
            if (game.objects[i] == null || game.objects[i].is_alive == false) {
                continue;
            }
            if (game.objects[i].is_alive == true) {
                // 当たり判定
                for (int j = 0; j < game.objects.length; j++) {
                    // null の場合はその場で終了
                    if (game.objects[j] == null || game.objects[i].is_alive == false) {
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
        int w = game.field.court.cellW();
        int h = game.field.court.cellH();
        int[] p1y = game.field.court.y1List();

        // Player1のシールドを展開
        int x = game.field.court.getX(2);
        for (int y = 0; y < p1y.length; y++) {
            game.spawn(new Shield(x, y * h));
        }

        // Player2のシールドを展開
        x = game.field.court.getX(19);
        for (int y = 0; y < p1y.length; y++) {
            game.spawn(new Shield(x, y * h));
        }
    }
}
