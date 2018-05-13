/**
 * Shadow
 */
class MobShadow extends MobCombat implements Gun {
    public int power_x;
    public int power_y;

    public MobShadow(String direction) {
        this.width = 100;
        this.height = 100;
        this.action_interval_ms = 5000;
        this.name = "shadow";
        this.type = "mob";
        this.texture = loadImage("t_shadow.png");
        this.power_y = 0;
        this.cost = 10;
        this.hp = 1500;

        if (direction == "right") {
            this.power_x = 3;
        } else {
            this.power_x = -3;
        }
    }

    public void action() {
        this.fire();
    }

        public void draw() {
        image(
            this.texture,
            this.x - this.margin_width,
            this.y - this.margin_height,
            this.width + this.margin_width * 2,
            this.height + this.margin_height * 2
        );
    }

    public void fire() {
        Bullet bullet = new Bullet(this.x + this.power_x * 15 , this.y + this.power_y, this.power_x, this.power_y);
        bullet.texture = loadImage("t_bullet2.png");
        bullet.attack = 300;
        bullet.width = 40;
        bullet.height = 40;
        game.spawn(bullet);
        bullet.se.play();
    }
}
