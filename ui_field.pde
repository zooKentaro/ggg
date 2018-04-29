/**
 * 戦闘フィールド
 */
class UiField extends Ui {
    public void setup() {
        // 20 x 10 マスとする
        this.divide_x = 20;
        this.divide_y = 10;

        // フィールドのX, Y座標
        this.x1 = game.config.FIELD_X;
        this.y1 = game.config.FIELD_Y;

        // フィールドの幅, 高さ
        this.w = game.config.FIELD_WIDTH;
        this.h = game.config.FIELD_HEIGHT;
    }

    public void update() {
        //
    }

    public void draw() {
        fill(220, 255, 220);
        rect(this.x1(), this.y1(), this.w(), this.h());
    }
}
