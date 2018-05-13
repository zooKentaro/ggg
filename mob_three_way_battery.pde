/**
 * 3way砲台
 */
class MobThreeWayBattery extends MobCombat implements Gun {
    public int power_x;
    public Sound se;

    public MobThreeWayBattery(String direction) {
        this.width = 40;
        this.height = 40;
        this.action_interval_ms = 5000;
        this.name = "three_way_battery";
        this.se = new Sound("fire_heavy");
        this.type = "mob";
        this.texture = loadImage("t_cyame.png");
        this.cost = 5;
        this.hp = 500;

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
        this.se.play();
        game.spawn(new Bullet(this.x, this.y, this.power_x, 4));
        game.spawn(new Bullet(this.x, this.y, this.power_x, 0));
        game.spawn(new Bullet(this.x, this.y, this.power_x, -4));
    }
}
