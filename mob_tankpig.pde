/**
 * タンクピッグ
 */
class MobTankPig extends MobCombat {
    public Sound se;
    public Player owner;

    public MobTankPig(Player player) {
        this.width = 60;
        this.height = 60;
        this.action_interval_ms = 2000000;
        this.name = "tankpig";
        this.se = new Sound("fire_heavy");
        this.type = "mob";
        this.texture = loadImage("t_tankpig.png");
        this.cost = 3;
        this.hp = 100;
        this.owner = player;
    }

    public void action() {
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
}
