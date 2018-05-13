/**
 * 砲台
 */
class MobBattery extends MobCombat implements Gun {
    public int power_x;
    public int power_y;

    public MobBattery(String direction) {
        this.width = 40;
        this.height = 40;
        this.action_interval_ms = 2000;
        this.name = "battery";
        this.type = "mob";
        this.texture = loadImage("t_enemy.png");
        this.power_y = 0;

        if (direction == "right") {
            this.power_x = 15;
        } else {
            this.power_x = -15;
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
        Bullet bullet = new Bullet(this.x, this.y, this.power_x, this.power_y);
        game.spawn(bullet);
        bullet.se.play();
    }
}
