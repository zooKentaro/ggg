class Bullet extends GameObject {
    public int speed  = 15;
    public int damage = 20;

    public Bullet(int x, int y) {
        this.x = x;
        this.y = y;
        this.width = 15;
        this.height = 15;
        this.name = "bullet";
        this.type = "bullet";
        this.texture = loadImage("bullet.png");
    }

    @Override
    protected void update() {
        this.x += this.speed;
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
