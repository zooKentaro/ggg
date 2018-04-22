class Player extends Mob {
    public int speed = 4;
    public int break_time_ms = 500;

    public Player(int x, int y) {
        this.x = x;
        this.y = y;
        this.width = 60;
        this.height = 60;
        this.label = "player";
        this.texture = loadImage("dragoon.png");
    }

    @Override
    protected void update() {
        if (game.key.left)  this.x -= speed;
        if (game.key.right) this.x += speed;
        if (game.key.up)    this.y -= speed;
        if (game.key.down)  this.y += speed;

        if (game.key.space && game.recoder.get("PUT_BLOCK") == 0) {
            GameObject block = new Block(this.x + this.width, this.y);

            // 特定のラベルが付いているオブジェクトの上には置けないようにする.
            String labels[] = {"player2", "block"};
            ArrayList<GameObject> obj = game.findByLabels(labels);
            for (int i = 0; i < obj.size(); i++) {
                if (block.isHitting(obj.get(i))) {
                    return;
                }
            }
            game.recoder.set("PUT_BLOCK", this.break_time_ms);
            game.spawn(block);
        }
    }

    @Override
    protected void draw() {
        image(this.texture, this.x, this.y, this.width, this.height);
    }

    @Override
    public void destroy() {
        this.is_alive = false;
    }
}
