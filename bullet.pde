class Bullet extends GameObject {
    public int damage = 20;
    public int power_x;
    public int power_y;

    public Bullet(int x, int y, int power_x, int power_y) {
        this.x = x;
        this.y = y;
        this.power_x = power_x;
        this.power_y = power_y;
        this.width = 15;
        this.height = 15;
        this.name = "bullet";
        this.type = "bullet";
        this.texture = loadImage("t_bullet.png");
    }

    @Override
    protected void update() {
        if (
            this.x < game.field.court.x1() || this.x > game.field.court.x2() ||
            this.y < game.field.court.y1() || this.y > game.field.court.y2()
        ) {
            this.is_alive = false;
        } else {
            this.x += this.power_x;
            this.y += this.power_y;
        }
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
