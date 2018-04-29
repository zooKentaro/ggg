/**
 * ベンチの１マス
 */
class UiBenchCell extends Ui {
    public UiBenchCell(int x1, int y1, int w, int h) {
        this.x1 = x1;
        this.y1 = y1;
        this.w = w;
        this.h = h;
    }

    public void setup() {
        // 1 x 1 マスとする
        this.divide_x = 1;
        this.divide_y = 1;
    }

    public void update() {
        //
    }

    public void draw() {
        fill(242, 225, 255);
        rect(this.x1(), this.y1(), this.w(), this.h());
    }
}
