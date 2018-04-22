class Player1 extends Player {
    public int speed = 2;

    public Player1(int x, int y) {
        this.x = x;
        this.y = y;
        this.width = 32;
        this.height = 32;
        this.margin_width = 4;
        this.margin_height = 4;
        this.label = "player";
        this.direction = "left";
        this.texture = loadImage("dragoon.png");
    }

    @Override
    public void controll() {
        if (game.key.left && this.lock_left == false && this.x > game.field.fieldX1())  this.x -= speed;
        if (game.key.right && this.lock_right == false && this.x + this.width < game.field.fieldX2()) this.x += speed;
        if (game.key.up && this.lock_up == false && this.y > game.field.fieldY1())    this.y -= speed;
        if (game.key.down && this.lock_down == false && this.y + this.height < game.field.fieldY2())  this.y += speed;

        if (game.key.space && game.recoder.get(this.getUnitTimerKey()) == 0) {
            this.putUnit();
            game.recoder.set(this.getUnitTimerKey(), this.break_time_ms);
        }
    }
}
