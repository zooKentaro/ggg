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

    public void draw(Game g) {
        // 動かせる
        if (g.key.left2)  this.x -= speed;
        if (g.key.right2) this.x += speed;
        if (g.key.up2)    this.y -= speed;
        if (g.key.down2)  this.y += speed;

        image(this.texture, this.x, this.y, this.width, this.height);

        if (g.key.space) {
            g.spawn(new Bullet(this.x, this.y));
        }
    }

    public void destroy(Game g) {
        this.is_alive = false;
    }
}
