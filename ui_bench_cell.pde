/**
 * ベンチの１マス
 */
class UiBenchCell extends Ui {
    public boolean is_focused = false;

    public UiBenchCell(int x1, int y1, int w, int h) {
        this.x1 = x1 + 1;
        this.y1 = y1;
        this.w = w - 2;
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
        strokeWeight(2);
        if (this.is_focused) {
            stroke(160, 160, 255);
        } else {
            stroke(225, 225, 255);
        }
        fill(242, 225, 255);
        rect(this.x1(), this.y1(), this.w(), this.h());
        strokeWeight(0);
        noStroke();
    }

    public void focus() {
        this.is_focused = true;
    }

    public void unfocus() {
        this.is_focused = false;
    }
}
