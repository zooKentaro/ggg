class Player extends Mob implements ControllerInterface {
    public int speed = 4;
    public int break_time_ms = 500;
    public Pointer pointer;
    public String mode = "";

    @Override
    protected void update() {
        if (this.mode == "select_and_move") {
            // 操作する
            this.controll();
        } else if (this.mode == "pointer") {
            // ポインタを操作する
            this.pointer.run();
        }
    }

    // ユニットを配置する
    public void putMob() {
        Mob mob = (Mob)(game.factory.generate("battery", this.direction).set(this.pointer.x + this.pointer.width, this.pointer.y + this.pointer.height));
        print("put");
        // 特定のラベルが付いているオブジェクトの上には置けないようにする.
        String types[] = {"player", "mob"};
        ArrayList<GameObject> obj = game.findByTypes(types);
        for (int i = 0; i < obj.size(); i++) {
            if (mob.isHitting(obj.get(i))) {
                return;
            }
        };
        game.spawn(mob);
    }

    @Override
    protected void draw() {
        image(
            this.texture,
            this.x - this.margin_width,
            this.y - this.margin_height,
            this.width + this.margin_width * 2,
            this.height + this.margin_height * 2
        );
    }

    @Override
    public void destroy() {
        this.is_alive = false;
    }

    public void controll() {
        //
    }

    protected String getMobTimerKey() {
        return "PUT_Mob_" + this.hashCode();
    }

    public void onHit(GameObject object) {
        super.onHit(object);
        if (object.type == "bullet") {
            this.destroy();
        }
    }
}
