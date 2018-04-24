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
        this.texture = loadImage("unicoon.png");
    }

    @Override
    public void controll() {
        if (game.key.up2 && this.lock_up == false && this.y > game.field.fieldY1())    this.y -= speed;
        if (game.key.down2 && this.lock_down == false && this.y + this.height < game.field.fieldY2())  this.y += speed;

        if (game.key.space2 && game.recoder.get(this.getUnitTimerKey()) == 0) {
            this.putUnit();
            game.recoder.set(this.getUnitTimerKey(), this.break_time_ms);
        }
    }
}
