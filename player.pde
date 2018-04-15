class Player extends Mob {
    public int speed = 4;

    public Player(int x, int y) {
        this.x = x;
        this.y = y;
        this.width = 60;
        this.height = 60;
        this.label = "player";
        this.texture = loadImage("dragoon.png");
    }

    @Override
    protected void update() {
        // 動かせる
        if (game.key.left)  this.x -= speed;
        if (game.key.right) this.x += speed;
        if (game.key.up)    this.y -= speed;
        if (game.key.down)  this.y += speed;

        if (game.key.space) {
            game.spawn(new Bullet(this.x, this.y));
        }
    }

    @Override
    protected void draw() {
        image(this.texture, this.x, this.y, this.width, this.height);
        ellipse(this.x, this.y, this.width, this.height);
    }

    @Override
    public void destroy() {
        this.is_alive = false;
    }
}
