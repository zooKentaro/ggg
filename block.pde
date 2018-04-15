class Block extends GameObject {
    public int speed = 2;

    public Block(int x, int y) {
        this.x = x;
        this.y = y;
        this.width = 100;
        this.height = 100;
        this.label = "block";
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
