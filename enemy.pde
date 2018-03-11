class Enemy extends GameObject {
    public int speed = 3;
    public PImage img;

    public Enemy(int x, int y) {
        this.x = x;
        this.y = y;
        this.width = 80;
        this.height = 60;
        this.img = loadImage("enemy.png");
    }

    public void draw(Game g) {
        this.x += random(0, 40);
        this.x -= random(0, 35);
        this.y += random(0, 30);
        this.y -= random(0, 30);
        fill(0, 0, 255);
        image(this.img, this.x, this.y, this.width, this.height);
    }

    public void destroy(Game g) {
        this.is_alive = false;
    }
}
