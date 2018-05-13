/**
 * ベンチ
 */
class UiBench extends Ui {
    public UiBenchCell[] cells;
    protected int idx;
    protected int CURSOR_INTERVAL_MS = 80;

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

        // 最初のセルにフォーカス
        this.focusFirst();

        // 1つ目のセルに一時的にユニットを設定してみる
        this.setMob(0, (Mob)(game.factory.generate("battery", "")));
    }

    public void update() {
        for (int i = 0; i < this.cells.length; i++) {
            this.cells[i].update();
        }
    }

    public void draw() {
        fill(200, 250, 0);
        rect(this.x1(), this.y1(), this.w(), this.h());

        for (int i = 0; i < this.cells.length; i++) {
            this.cells[i].draw();
        }
    }

    public void focus(int idx) {
        if (game.recoder.get(this.getCursrTimerKey()) != 0) {
            return;
        }
        game.recoder.set(this.getCursrTimerKey(), this.CURSOR_INTERVAL_MS);
        // 前のフォーカスを外す
        this.cells[this.idx].unfocus();

        // 新しくフォーカスする
        this.setIdx(idx);
        this.cells[idx].focus();
    }

    public void focusFirst() {
        this.focus(0);
    }

    public void focusNext() {
        if (this.idx + 1 >= this.cells.length) {
            return;
        }
        this.focus(this.idx + 1);
    }

    public void focusPrev() {
        if (this.idx - 1 < 0) {
            return;
        }
        this.focus(this.idx - 1);
    }

    protected void setIdx(int idx) {
        if (idx < this.cells.length) {
            this.idx = idx;
        }
    }

    protected String getCursrTimerKey() {
        return "MOVE_CURSOR_" + this.hashCode();
    }

    /**
     * 指定されたセルにモブをセットする
     * セルが存在しなければ何もしない
     */
    public void setMob(int idx, Mob mob) {
        if (idx < this.cells.length) {
            this.cells[idx].setMob(mob);
        }
    }

    public Mob focusedMob() {
        return this.cells[this.idx].mob;
    }
}
