class Pointer1 extends Pointer {
    public int speed = 5;

    public Pointer1(int x, int y) {
        this.x = x;
        this.y = y;
        this.width = 10;
        this.height = 10;
    }

    @Override
    public void controll() {
        if (game.key.left && this.x > game.field.x1()) this.x -= speed;
        if (game.key.right &&  this.x + this.height < game.field.x2()) this.x += speed;
        if (game.key.up && this.y > game.field.y1()) this.y -= speed;
        if (game.key.down &&  this.y + this.height < game.field.y2()) this.y += speed;
    }
}
