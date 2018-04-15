class Player2 extends GameObject {
    public int speed = 4;

    public Player2(int x, int y) {
        this.x = x;
        this.y = y;
        this.width = 60;
        this.height = 60;
        this.label = "player";
        this.texture = loadImage("bullet.png");
    }

    @Override
    protected void update() {
        if (game.key.left2)  this.x -= speed;
        if (game.key.right2) this.x += speed;
        if (game.key.up2)    this.y -= speed;
        if (game.key.down2)  this.y += speed;
    }

    @Override
    protected void draw() {
        image(this.texture, this.x, this.y, this.width, this.height);
    }

    @Override
    public void destroy() {
        this.is_alive = false;
    }
}
