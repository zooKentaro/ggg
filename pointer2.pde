class Pointer2 extends Pointer {
    public int speed = 5;

    Pointer2(int x, int y) {
        this.x = x;
        this.y = y;
        this.width = 15;
        this.height = 15;
    }

    @Override
    public void controll() {
        if (game.key.left2 && this.x > game.field.x1()) this.x -= speed;
        if (game.key.right2 &&  this.x + this.height < game.field.x2()) this.x += speed;
        if (game.key.up2 && this.y > game.field.y1()) this.y -= speed;
        if (game.key.down2 &&  this.y + this.height < game.field.y2()) this.y += speed;
    }
}
