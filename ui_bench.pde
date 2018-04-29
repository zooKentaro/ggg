/**
 * ベンチ
 */
class UiBench extends Ui {
    public UiBench(int x1, int y1, int h) {
        this.x1 = x1;
        this.y1 = y1;
        this.h = h;
    }

    public void setup() {
        // 20 x 1 マスとする
        this.divide_x = 20;
        this.divide_y = 1;

        // フィールドの半分の幅
        this.w = game.field.w() / 2;
    }

    public void update() {
        //
    }

    public void draw() {
        fill(200, 250, 0);
        rect(this.x1(), this.y1(), this.w(), this.h());
    }
}
