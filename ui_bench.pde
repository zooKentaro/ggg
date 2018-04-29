/**
 * ベンチ
 */
class UiBench extends Ui {
    public UiBenchCell[] cells;

    public UiBench(int x1, int y1, int h) {
        this.x1 = x1;
        this.y1 = y1;
        this.h = h;
    }

    public void setup() {
        // 10 x 1 マスとする
        this.divide_x = 10;
        this.divide_y = 1;

        // フィールドの半分の幅
        this.w = game.field.w() / 2;

        // セルを敷き詰める
        this.cells = new UiBenchCell[this.divide_x];
        for (int i = 0; i < this.divide_x; i++) {
            this.cells[i] = new UiBenchCell(this.x1() + (this.cellW() * i), this.y1(), this.cellW(), this.cellH());
            this.cells[i].setup();
        }
    }

    public void update() {
        //
    }

    public void draw() {
        fill(200, 250, 0);
        rect(this.x1(), this.y1(), this.w(), this.h());

        for (int i = 0; i < this.cells.length; i++) {
            this.cells[i].run();
        }
    }
}
