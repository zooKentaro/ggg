class BulletPinPointFire extends Bullet {
    public int attack;

    public BulletPinPointFire(int x, int y) {
        super(x, y, 0, 0);
        this.x = x;
        this.y = y;
        this.width = 40;
        this.height = 40;
        this.name = "bullet_pin_point_fire";
        this.type = "bullet";
    }

    protected void update() {
        super.update();
        if (this.width > 0 || this.height > 0) {
            this.width--;
            this.height--;
        }
    }

    protected void draw() {
        //
    }
}
