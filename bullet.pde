class Bullet extends GameObject {
    public int damage = 20;
    public int power_x;
    public int power_y;
    public Sound se;

    public Bullet(int x, int y, int power_x, int power_y) {
        this.x = x;
        this.y = y;
        this.power_x = power_x;
        this.power_y = power_y;
        this.width = 15;
        this.height = 15;
        this.name = "bullet";
        this.type = "bullet";
        this.texture = loadImage("t_bullet.png");
        this.se = new Sound("fire_heavy");
    }

    @Override
    protected void update() {
        if (
            this.x < game.field.court.x1() || this.x > game.field.court.x2() ||
            this.y < game.field.court.y1() || this.y > game.field.court.y2()
        ) {
            this.is_alive = false;
        } else {
            this.x += this.power_x;
            this.y += this.power_y;
        }
    }

    public void onHit(GameObject object) {
        if (object.type == "shield") {
            this.destroy();
        }
    }

    @Override
    protected void draw() {
        image(this.texture, this.x, this.y, this.width, this.height);
    }

    @Override
    public void destroy() {
        // すぐに爆発するのではなく、少し進んで爆発させる
        this.x += this.power_x * 1;
        this.y += this.power_x * 1;

        // 爆発
        EffectBomNormal effect = new EffectBomNormal();
        effect.x = this.x;
        effect.y = this.y;
        game.spawn(effect);

        this.is_alive = false;
    }
}
