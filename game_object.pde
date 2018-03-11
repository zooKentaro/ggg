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

    // オブジェクトを描画する
    abstract void drow();

    // オブジェクトを破壊する (消す)
    abstract void destroy();
}
