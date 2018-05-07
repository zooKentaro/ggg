/**
 * コート
 */
class UiCourt extends Ui {
    public UiCourt(int x1, int y1, int h) {
        this.x1 = x1;
        this.y1 = y1;
        this.h = h;
    }

    public void setup() {
        // 20 x 10 マスとする
        this.divide_x = 20;
        this.divide_y = 10;

        this.w = game.field.w();
    }

    public void update() {
        //
    }

    public void draw() {
        fill(100, 250, 100);
        rect(this.x1(), this.y1(), this.w(), this.h());
    }
}
