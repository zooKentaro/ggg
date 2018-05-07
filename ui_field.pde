/**
 * 戦闘フィールド
 */
class UiField extends Ui {
    public UiCourt court;
    public UiBench bench1;
    public UiBench bench2;

    public void setup() {
        // 20 x 11 マスとする
        this.divide_x = 20;
        this.divide_y = 11;

        // フィールドのX, Y座標
        this.x1 = game.config.FIELD_X;
        this.y1 = game.config.FIELD_Y;

        // フィールドの幅, 高さ
        this.w = game.config.FIELD_WIDTH;
        this.h = game.config.FIELD_HEIGHT;

        this.court = new UiCourt(this.x1(), this.y1(), this.cellH() * 10);
        this.court.setup();
        this.bench1 = new UiBench(this.x1() + this.w() / 2, this.y2() - this.cellH(), this.cellH());
        this.bench1.setup();
        this.bench2 = new UiBench(this.x1(), this.y2() - this.cellH(), this.cellH());
        this.bench2.setup();
    }

    public void update() {
        //
    }

    public void draw() {
        fill(220, 255, 220);
        rect(this.x1(), this.y1(), this.w(), this.h());

        this.court.run();
        this.bench1.run();
        this.bench2.run();
    }
}
