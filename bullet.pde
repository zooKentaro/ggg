class Bullet extends GameObject {
    public int speed  = 30;
    public int damage = 20;

    public Bullet(int x, int y) {
        this.x = x;
        this.y = y;
        this.width = 5;
        this.height = 5;
    }

    @Override
    protected void update() {
        this.x += this.speed;
    }

    @Override
    protected void draw() {
        ellipse(this.x, this.y, this.width, this.height);
    }

    @Override
    public void destroy() {
        this.is_alive = false;
    }
    
}
