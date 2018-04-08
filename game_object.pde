abstract class GameObject {
    // オブジェクトのX座標
    public int x;
    // オブジェクトのY座標
    public int y;
    // オブジェクトの横幅 (px)
    public int width = 0;
    // オブジェクトの縦幅 (px)
    public int height = 0;
    // オブジェクトがゲーム上に存在可能かどうか
    public boolean is_alive = true;
    // 画像
    public PImage texture;
    // ラベル
    public String label = "";

    // オブジェクトを描画する
    abstract void draw(Game g);

    // オブジェクトを破壊する (消す)
    abstract void destroy(Game g);

    /**
     * objectと接触しているかどうかを確認する
     * 接触していれば、対象のオブジェクトを引数に
     * onHit() を呼び出す
     */
    public void checkHitting(GameObject object) {
        // 同じインスタンス同士ではfalse
        if (this.hashCode() == object.hashCode()) {
            return;
        }

        // 座標から当たり判定
        if (
            this.x   < object.x + object.width &&
            object.x < this.x + this.width &&
            this.y   < object.y + object.height &&
            object.y < this.y + this.height
        ) {
            this.onHit(object);
        }
    }

    public void onHit(GameObject object) {
        //
    }
}
