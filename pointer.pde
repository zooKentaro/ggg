class Pointer extends GameObject implements ControllerInterface {
    public int speed = 4;

    @Override
    protected void update() {
        // 操作する
        this.controll();
    }

    @Override
    protected void draw() {
        fill(0, 0, 255);
        ellipse(this.x, this.y, this.width, this.height);
    }

    public void controll() {
        //
    }

    public void destroy() {
        //
    }
}
