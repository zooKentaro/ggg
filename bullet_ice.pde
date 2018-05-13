class BulletIce extends Bullet {
    public int attack;
    public int power_x;
    public int power_y;
    public Sound se;

    public BulletIce(int x, int y, int power_x, int power_y) {
        super(x, y, power_x, power_y);
        this.x = x;
        this.y = y;
        this.power_x = power_x;
        this.power_y = power_y;
        this.width = 30;
        this.height = 20;
        this.name = "bullet_ice";
        this.type = "bullet";
        this.texture = loadImage("t_bullet_ice.png");
        this.se = new Sound("fire_heavy");
        // 攻撃力
        this.attack = 150;
    }
}
