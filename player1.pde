class Player1 extends Player {
    public int speed = 2;

    public Player1(int x, int y) {
        this.x = x;
        this.y = y;
        this.width = 32;
        this.height = 32;
        this.margin_width = 4;
        this.margin_height = 4;
        this.name = "player1";
        this.type = "player";
        this.direction = "left";
        this.texture = loadImage("t_player1.gif");
        this.mode = "select_and_move";
        this.pointer = new Pointer1(this.x, this.y);
        this.direction = "left";
        this.bench = game.field.bench1;
        this.potato = game.hud.potato_gauge1;
    }

    public void update() {
        super.update();
        if (game.key.enter && game.recoder.get("player1_change_mode") == 0) {
            game.recoder.set("player1_change_mode", 300);
            this.mode = this.mode == "select_and_move" ? "pointer" : "select_and_move";
        }
        if (this.mode == "pointer" && game.key.space && game.recoder.get(this.getMobTimerKey()) == 0) {
            this.putMob();
            this.castSpell();
            game.recoder.set(this.getMobTimerKey(), this.break_time_ms);
        }
    }

    @Override
    public void controll() {
        if (game.key.up && this.lock_up == false && this.y > game.field.court.y1())    this.y -= speed;
        if (game.key.down && this.lock_down == false && this.y + this.height < game.field.court.y2())  this.y += speed;
        if (game.key.right) game.field.bench1.focusNext();
        if (game.key.left) game.field.bench1.focusPrev();
    }
}
