class Enemy extends GameObject {
    public int speed = 2;

    public Enemy(int x, int y) {
        this.x = x;
        this.y = y;
        this.width = 60;
        this.height = 60;
        this.label = "enemy";
        this.texture = loadImage("enemy.png");
    }

    public void draw() {
        this.x -= this.speed;
        image(this.texture, this.x, this.y, this.width, this.height);
    }

    public void destroy() {
        this.is_alive = false;
    }
}
