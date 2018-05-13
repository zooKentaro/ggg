/**
 * ポテトゲージ
 */
class UiGaugePotato extends UiGauge {
    // ポテトポイント
    public int ppt;

    // 初期ポテトポイント
    public int init_ppt = 100;

    // 最大ポテトポイント
    public int max_ppt;

    // 初期最大ポテトポイント
    public int init_max_ppt = 1000;

    // 最大値を伸ばすために必要なポテトポイント
    public int limit_break_ppt = 300;

    // ポテト１につき 100フレーム
    public int ppt_per_num = 100;

    public int tmp_time;

    public UiGaugePotato(int x1, int y1) {
        this.x1 = x1;
        this.y1 = y1;

        this.ppt = this.init_ppt;
        this.max_ppt = this.init_max_ppt;
    }

    public void setup() {
        // 10 x 1 マスとする
        this.divide_x = 10;
        this.divide_y = 1;

        // フィールドの1/3の幅
        this.w = game.field.w() / 3;
        this.h = 20;
    }

    public void update() {
        this.ppt++;

        // リミットブレイクに達していれば最大値を伸ばす
        if (this.ppt > this.max_ppt + this.limit_break_ppt) {
            this.ppt = this.max_ppt;
            this.max_ppt += this.ppt_per_num;
        }
    }

    public void draw() {

        stroke(22);
        fill(222, 222, 222);
        rect(this.x1(), this.y1(), this.max_ppt / 5, this.h());

        fill(252, 242, 22);
        rect(this.x1(), this.y1(), this.currentPt() / 5, this.h());
        noStroke();

        fill(0, 0, 0);
        text(this.currentNum() + " / " + this.maxNum(), this.x1(), this.y2() + 15);
    }

    public int currentPt() {
        return this.ppt > this.max_ppt ? this.max_ppt : this.ppt;
    }

    public int currentNum() {
        return int(floor(this.currentPt() / this.ppt_per_num));
    }

    public int maxNum() {
        return int(floor(this.max_ppt / this.ppt_per_num));
    }

    public void consume(int num) {
        this.ppt -= num * this.ppt_per_num;
        if (this.ppt < 0) {
            this.ppt = 0;
        }
    }
}
