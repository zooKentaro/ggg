class Enemy extends Mob {
    public int speed = 2;

    public Enemy(int x, int y) {
        this.x = x;
        this.y = y;
        this.width = 60;
        this.height = 60;
        this.label = "enemy";
        this.texture = loadImage("enemy.png");
    }

    @Override
    public void update()
    {
        this.x -= this.speed;
    }

    @Override
    public void draw() {
        image(this.texture, this.x, this.y, this.width, this.height);
    }

    @Override
    public void destroy() {
        this.is_alive = false;
    }
}
