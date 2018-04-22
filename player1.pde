class Player1 extends Player {
    public int speed = 4;

    public Player1(int x, int y) {
        this.x = x;
        this.y = y;
        this.width = 60;
        this.height = 60;
        this.label = "player";
        this.texture = loadImage("dragoon.png");
    }

    @Override
    public void controll() {
        if (game.key.left)  this.x -= speed;
        if (game.key.right) this.x += speed;
        if (game.key.up)    this.y -= speed;
        if (game.key.down)  this.y += speed;

        if (game.key.space && game.recoder.get(this.getUnitTimerKey()) == 0) {
            this.putUnit();
            game.recoder.set(this.getUnitTimerKey(), this.break_time_ms);
        }
    }
}
