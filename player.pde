class Player extends GameObject {
    public int speed = 3;

    public Player(int x, int y) {
        this.x = x;
        this.y = y;
        this.width = 20;
        this.height = 20;
    }

    public void draw(Game g) {
        // 動かせる
        if (g.key.left)  this.x -= speed;
        if (g.key.right) this.x += speed;
        if (g.key.up)    this.y -= speed;
        if (g.key.down)  this.y += speed;

            ellipse(this.x, this.y, this.width, this.height);
            if(g.key.enter == true){
        }

        if (g.key.space == true) {
            Bullet bullet = new Bullet(this.x, this.y);
            g.spawn(bullet);
            }
    }

    public void destroy(Game g) {
        this.is_alive = false;
    }
}
