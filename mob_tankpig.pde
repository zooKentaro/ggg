/**
 * タンクピッグ
 */
class MobTankPig extends MobCombat implements Gun  {
    public int power_x;
    public int power_y;
    public Sound se;
    public Player owner;

    public MobTankPig(Player player) {
        this.width = 60;
        this.height = 60;
        this.action_interval_ms = 2000;
        this.name = "tankpig";
        this.se = new Sound("fire_heavy");
        this.type = "mob";
        this.texture = loadImage("t_tankpig.png");
        this.cost = 3;
        this.hp = 100;
        this.owner = player;

        if (player != null && player.direction == "right") {
            this.power_x = 15;
        } else {
            this.power_x = -15;
        }
    }

    public void action() {
        this.fire();
    }

    public void cip() {
        // ポテトの最大値を上げる
        this.owner.potato.upMaxNum(1);
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
        Bullet bullet = new Bullet(this.x + this.power_x * 2, this.y, this.power_x, this.power_y);
        game.spawn(bullet);
        bullet.se.play();
    }
}
