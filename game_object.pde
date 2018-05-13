abstract class GameObject {
    // オブジェクトのX座標
    public int x;
    // オブジェクトのY座標
    public int y;
    // オブジェクトの横幅 (px)
    public int width = 0;
    // オブジェクトの縦幅 (px)
    public int height = 0;
    // オブジェクトの描画領域の上下マージン
    public int margin_width = 0;
    // オブジェクトの描画領域の上下マージン
    public int margin_height = 0;
    // オブジェクトがゲーム上に存在可能かどうか
    public boolean is_alive = true;
    // 画像
    public PImage texture;
    // 名前
    public String name = "object";
    // タイプ
    public String type = "object";
    // ラベル
    public String label = "";

    // HP
    public int hp = 0;

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
     * オプジェクトの中央のX座標を返す
     *
     * @return int 中央のX座標
     */
    public int cX() {
        return this.x + this.width / 2;
    }

    /**
     * オプジェクトの中央のY座標を返す
     *
     * @return int 中央のY座標
     */
    public int cY() {
        return this.y + this.height / 2;
    }

    public void damage() {
        //
    }

    /**
     * xとyをセットする
     *
     * @param int x x座標
     * @param int y y座標
     * @return GameObject
     */
    public GameObject set(int x, int y) {
        this.x = x;
        this.y = y;
        return this;
    }

    /**
     * 指定されたX,Y座標が中央になるようにxとyをセットする
     *
     * @param int x 中央のx座標
     * @param int y 中央のy座標
     * @return GameObject
     */
    public GameObject setCenter(int x, int y) {
        this.x = x - this.width / 2;
        this.y = y - this.height / 2;
        return this;
    }

    /**
     * スポンした時に発動する
     */
    public void cip() {
        //
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

        // ゲームオブジェクトが生きていなければfalse
        if (object.is_alive == false) {
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
