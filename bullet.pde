class Bullet extends GameObject {
    public int speed  = 30;
    public int damage = 20;

    public Bullet(int x, int y) {
        this.x = x;
        this.y = y;
        this.width = 5;
        this.height = 5;
        }

    public void draw(Game g) {
        ellipse(this.x, this.y, this.width, this.height); //弾の動き
        this.x += this.speed;
    }

    public void destroy(Game g) {
        this.is_alive = false;
    }
}
