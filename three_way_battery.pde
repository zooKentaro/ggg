/**
 * 3way砲台
 */
class ThreeWayBattery extends UnitCombat implements Gun {
    public int power_x;

    public ThreeWayBattery(String direction) {
        this.width = 20;
        this.height = 20;
        this.action_interval_ms = 5000;
        this.name = "three_way_battery";
        this.type = "unit";

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
        game.spawn(new Bullet(this.x, this.y, this.power_x, 4));
        game.spawn(new Bullet(this.x, this.y, this.power_x, 0));
        game.spawn(new Bullet(this.x, this.y, this.power_x, -4));
    }
}
