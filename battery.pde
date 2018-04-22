/**
 * 砲台
 */
class Battery extends UnitCombat implements Gun {
    public Battery() {
        this.width = 20;
        this.height = 20;
        this.action_interval_ms = 2000;
    }

    public void action() {
        this.fire();
    }

    public void fire() {
        game.spawn(new Bullet(this.x, this.y));
    }
}
