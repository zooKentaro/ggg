class Unit extends GameObject {
    public int speed = 2;

    public Unit() {
        this.x = 0;
        this.y = 0;
        this.width = 40;
        this.height = 40;
        this.label = "unit";
    }

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
