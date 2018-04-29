class Shield extends GameObject {

    Shield(int x, int y) {
        this.x = x;
        this.y = y;
        this.width = game.field.cellW();
        this.height = game.field.cellH();
        this.texture = loadImage("t_block_hard.png");
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
}
