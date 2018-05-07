/**
 * 砲台
 */
class MobBattery extends MobCombat implements Gun {
    public int power_x;
    public int power_y;

    public MobBattery(String direction) {
        this.width = 20;
        this.height = 20;
        this.action_interval_ms = 2000;
        this.name = "battery";
        this.type = "mob";
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

    public void fire() {
        game.spawn(new Bullet(this.x, this.y, this.power_x, this.power_y));
    }
}
