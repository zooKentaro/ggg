/**
 * 戦闘フィールドの情報を管理する
 */
class Field {
    // 分割数 20 x 10
    protected int divide_x = 20;
    protected int divide_y = 10;

    /**
     * 1マスの横幅
     */
    public int sectionW() {
        return this.fieldW() / this.divide_x;
    }

    /**
     * 1マスの縦幅
     */
    public int sectionH() {
        return this.fieldH() / this.divide_y;
    }

    /**
     * フィールドのX1座標 (左上)
     */
    public int fieldX1() {
        return game.config.FIELD_X;
    }

    /**
     * フィールドのY1座標 (左上)
     */
    public int fieldY1() {
        return game.config.FIELD_Y;
    }

    /**
     * フィールドのX2座標 (右下)
     */
    public int fieldX2() {
        return this.fieldX1() + this.fieldW();
    }

    /**
     * フィールドのY2座標 (右下)
     */
    public int fieldY2() {
        return this.fieldY1() + this.fieldH();
    }

    /**
     * フィールドの横幅
     */
    public int fieldW() {
        return game.config.FIELD_WIDTH;
    }

    /**
     * フィールドの高さ
     */
    public int fieldH() {
        return game.config.FIELD_HEIGHT;
    }

    /**
     * 列番号からX1座標に変換する
     */
    public int X(int col_num) {
        if (col_num < 1 || col_num > divide_x) {
            return 0;
        }
        return (col_num - 1) * this.sectionW() + this.fieldX1();
    }

    /**
     * 行番号からY1座標に変換する
     */
    public int Y(int row_num) {
        if (row_num < 1 || row_num > divide_y) {
            return 0;
        }
        return (row_num - 1) * this.sectionH() + this.fieldY1();
    }

    /**
     * 1マスずつのX座標の配列
     */
    public int[] fieldX1List() {
        int x[] = new int[this.divide_x];
        for (int i = 0; i < x.length; i++) {
            x[i] = i * this.sectionW();
        }
        return x;
    }

    /**
     * 1マスずつのY座標の配列
     */
    public int[] fieldY1List() {
        int y[] = new int[this.divide_y];
        for (int i = 0; i < y.length; i++) {
            y[i] = i * this.sectionH();
        }
        return y;
    }
}
