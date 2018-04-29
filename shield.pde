class Shield extends GameObject {

    Shield(int x, int y) {
        this.x = x;
        this.y = y;
        this.width = game.field.cellW();
        this.height = game.field.cellH();
    }

    @Override
    public void update()
    {
        //
    }

    @Override
    public void draw() {
        fill(222, 222, 222);
        rect(this.x, this.y, this.width, this.height);
    }

    @Override
    public void destroy() {
        this.is_alive = false;
    }
}
