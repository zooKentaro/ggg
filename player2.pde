class Player2 extends Player {
    public int speed = 2;

    public Player2(int x, int y) {
        this.x = x;
        this.y = y;
        this.width = 40;
        this.height = 40;
        this.label = "player";
        this.texture = loadImage("bullet.png");
    }

    @Override
    public void controll() {
        if (game.key.left2)  this.x -= speed;
        if (game.key.right2) this.x += speed;
        if (game.key.up2)    this.y -= speed;
        if (game.key.down2)  this.y += speed;

        if (game.key.space2 && game.recoder.get(this.getUnitTimerKey()) == 0) {
            this.putUnit();
            game.recoder.set(this.getUnitTimerKey(), this.break_time_ms);
        }
    }
}
