class Player extends GameObject {
    public int speed = 9;

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

        fill(0, 0, 255);
        ellipse(this.x, this.y, this.width, this.height);
    }

    public void destroy(Game g) {

    }

    public void onHit(Game g, GameObject object) {
        g.changeScene(SceneNum.OVER);
        this.is_alive = false;
    }
}
