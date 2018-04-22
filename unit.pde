class Unit extends GameObject {
    public int speed = 2;

    @Override
    public void update()
    {
        //
    }

    @Override
    public void draw() {
        rect(this.x, this.y, this.width, this.height);
    }

    @Override
    public void destroy() {
        this.is_alive = false;
    }
}
