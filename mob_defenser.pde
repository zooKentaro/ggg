/**
 * Defenser
 */
class MobDefenser extends MobCombat {
    public int power_x;
    public int power_y;

    public MobDefenser(String direction) {
        this.width = 40;
        this.height = 40;
        this.action_interval_ms = 0;
        this.name = "defenser";
        this.type = "mob";
        this.texture = loadImage("t_defenser.png");
        this.power_y = 0;
        this.cost = 7;
        this.hp = 3000;

        if (direction == "right") {
            this.power_x = 3;
        } else {
            this.power_x = -3;
        }
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
