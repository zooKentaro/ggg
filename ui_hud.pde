/**
 * 戦闘フィールド
 */
class UiHud extends Ui {
    public UiGaugePotato potato_gauge1;
    public UiGaugePotato potato_gauge2;
    public void setup() {
        // フィールドのX, Y座標
        this.x1 = game.config.HUD_X;
        this.y1 = game.config.HUD_Y;

        // フィールドの幅, 高さ
        this.w = game.config.HUD_WIDTH;
        this.h = game.config.HUD_HEIGHT;

        int margin_x = 40;
        int margin_y = 40;

        this.potato_gauge1 = new UiGaugePotato(this.x1() + this.w() / 2 + margin_x, this.y1() + margin_y);
        this.potato_gauge1.setup();
        this.potato_gauge2 = new UiGaugePotato(this.x1() + margin_x, this.y1() + margin_y);
        this.potato_gauge2.setup();
    }

    public void update() {
        //
    }

    public void draw() {
        fill(220, 255, 180);
        rect(this.x1(), this.y1(), this.w(), this.h());

        this.potato_gauge1.run();
        this.potato_gauge2.run();
    }
}
