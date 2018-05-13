/**
 * ゲージ
 */
class UiGauge extends Ui {
    public void setup() {
        // 10 x 1 マスとする
        this.divide_x = 10;
        this.divide_y = 1;

        // フィールドの1/3の幅
        this.w = game.field.w() / 3;
        this.h = 20;
    }

    public void update() {
        //
    }

    public void draw() {
        //
    }
}
