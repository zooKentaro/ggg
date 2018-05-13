class Shield extends GameObject {
    public PImage texture_dmg1;
    public PImage texture_dmg2;
    public PImage texture_dmg3;

    Shield(int x, int y) {
        this.x = x;
        this.y = y;
        this.width = game.field.cellW();
        this.height = game.field.cellH();
        this.name = "shield";
        this.type = "shield";
        this.hp = 800;
        this.texture = loadImage("t_block_normal.png");
        this.texture_dmg1 = loadImage("t_block_normal_dmg1.png");
        this.texture_dmg2 = loadImage("t_block_normal_dmg2.png");
        this.texture_dmg3 = loadImage("t_block_normal_dmg3.png");
    }

    @Override
    public void update()
    {
        //
    }

    @Override
    public void draw() {
        fill(222, 222, 222);
        image(
            this.texture,
            this.x - this.margin_width,
            this.y - this.margin_height,
            this.width + this.margin_width * 2,
            this.height + this.margin_height * 2
        );
    }

    @Override
    public void destroy() {
        this.is_alive = false;
    }

    public void onHit(GameObject object) {
        if (object.type == "bullet") {
            Bullet bullet = (Bullet)object;
            this.hp -= bullet.attack;
            if (this.hp < 100) {
                this.destroy();
            } else if (this.hp < 300) {
                this.texture = this.texture_dmg3;
            } else if (this.hp < 500) {
                this.texture = this.texture_dmg2;
            } else if (this.hp < 800) {
                this.texture = this.texture_dmg1;
            }
        }
    }
}
