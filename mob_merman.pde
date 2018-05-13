/**
 * マーマン
 */
class MobMerman extends MobCombat implements Gun {
    public int power_x;
    public Sound se;

    public MobMerman(String direction) {
        this.width = 40;
        this.height = 40;
        this.action_interval_ms = 1000;
        this.name = "merman";
        this.se = new Sound("fire_heavy");
        this.type = "mob";
        this.texture = loadImage("t_merman.png");
        this.cost = 6;
        this.hp = 800;

        if (direction == "right") {
            this.power_x = 20;
        } else {
            this.power_x = -20;
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
        this.se.play();
        game.spawn(new BulletIce(this.x + this.power_x * 2, this.y + 8, this.power_x, 0));
        game.spawn(new BulletIce(this.x + this.power_x * 2, this.y - 8, this.power_x, 0));
    }
}
