/**
 * 画面を形成するUIを管理する
 */
abstract class Ui {
    // UIをマスで分割する際の行列の数
    public int divide_x = 1;
    public int divide_y = 1;

    // フィールドのX1座標
    public int x1 = 0;

    // フィールドのY1座標
    public int y1 = 0;

    // フィールドの幅
    public int w = 0;

    // フィールドの高さ
    public int h = 0;

    // 開始時に１度だけ呼び出す用のメソッド
    abstract void setup();

    // 描画直前の１フレームごとの更新処理用のメソッド
    abstract void update();

    // 描画メソッド
    abstract void draw();

    public void run() {
        this.update();

        this.draw();
    }

    /**
     * 1マスの横幅
     */
    public int cellW() {
        return this.w() / this.divide_x;
    }

    /**
     * 1マスの縦幅
     */
    public int cellH() {
        return this.h() / this.divide_y;
    }

    /**
     * フィールドのX1座標 (左上)
     */
    public int x1() {
        return this.x1;
    }

    /**
     * フィールドのY1座標 (左上)
     */
    public int y1() {
        return this.y1;
    }

    /**
     * フィールドのX2座標 (右下)
     */
    public int x2() {
        return this.x1() + this.w();
    }

    /**
     * フィールドのY2座標 (右下)
     */
    public int y2() {
        return this.y1() + this.h();
    }

    /**
     * フィールドの横幅
     */
    public int w() {
        return this.w;
    }

    /**
     * フィールドの高さ
     */
    public int h() {
        return this.h;
    }

    /**
     * 列番号からX1座標に変換する
     */
    public int getX(int col_num) {
        if (col_num < 1 || col_num > this.divide_x) {
            return 0;
        }
        return (col_num - 1) * this.cellW() + this.x1();
    }

    /**
     * 行番号からY1座標に変換する
     */
    public int getY(int row_num) {
        if (row_num < 1 || row_num > this.divide_y) {
            return 0;
        }
        return (row_num - 1) * this.cellH() + this.y1();
    }

    /**
     * 1マスずつのX座標の配列
     */
    public int[] x1List() {
        int x[] = new int[this.divide_x];
        for (int i = 0; i < x.length; i++) {
            x[i] = i * this.cellW();
        }
        return x;
    }

    /**
     * 1マスずつのY座標の配列
     */
    public int[] y1List() {
        int y[] = new int[this.divide_y];
        for (int i = 0; i < y.length; i++) {
            y[i] = i * this.cellH();
        }
        return y;
    }
}
