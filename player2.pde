class Player2 extends Player {
    public int speed = 2;

    public Player2(int x, int y) {
        this.x = x;
        this.y = y;
        this.width = 40;
        this.height = 40;
        this.name = "player2";
        this.type = "player";
        this.direction = "right";
        this.texture = loadImage("t_unicoon.png");
        this.mode = "select_and_move";
        this.pointer = new Pointer2(this.x, this.y);
    }

    public void update() {
        super.update();
        if (game.key.enter2 && game.recoder.get("player2_change_mode") == 0) {
            game.recoder.set("player2_change_mode", 300);
            this.mode = this.mode == "select_and_move" ? "pointer" : "select_and_move";
        }
        if (this.mode == "pointer" && game.key.space2 && game.recoder.get(this.getUnitTimerKey()) == 0) {
            this.putUnit();
            game.recoder.set(this.getUnitTimerKey(), this.break_time_ms);
        }
    }

    @Override
    public void controll() {
        if (game.key.up2 && this.lock_up == false && this.y > game.field.court.y1())    this.y -= speed;
        if (game.key.down2 && this.lock_down == false && this.y + this.height < game.field.court.y2())  this.y += speed;
        if (game.key.right2) game.field.bench2.focusNext();
        if (game.key.left2) game.field.bench2.focusPrev();
    }
}
