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

    // オブジェクトを更新する
    protected abstract void update();

    // オブジェクトを描画する
    protected abstract void draw();

    // オブジェクトを破壊する (消す)
    public abstract void destroy();

    /**
     * ゲーム内に存在するオブジェクトとして更新・描画する
     */
    public void run() {
        this.update();

        this.draw();
    }

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
        if (this.isHitting(object)) {
            this.onHit(object);
        }
    }

    public boolean isHitting(GameObject object) {
        return this.x < object.x + object.width &&
            object.x < this.x + this.width &&
            this.y   < object.y + object.height &&
            object.y < this.y + this.height;
    }

    public void onHit(GameObject object) {
        //
    }
}
