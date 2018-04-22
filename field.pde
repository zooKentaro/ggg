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
}
