class Shield extends GameObject {

    Shield(int x, int y) {
        this.x = x;
        this.y = y;
        this.width = game.field.sectionW();
        this.height = game.field.sectionH();
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
