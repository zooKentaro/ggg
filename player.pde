class Player extends Mob implements ControllerInterface {
    public int speed = 4;
    public int break_time_ms = 500;
    public Pointer pointer;
    public String mode = "";
    public Sound se;
    public UiBench bench;
    public UiGaugePotato potato;

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
        // 選択されているモブを取得
        Mob target_mob = this.bench.focusedMob();
        if (target_mob == null || target_mob.type == "spell" || target_mob.cost > this.potato.currentNum()) {
            return;
        }

        // 選択されているモブを新しく初期化
        Mob mob = game.factory.generate(target_mob.name, this);
        mob.setCenter(this.pointer.cX(), this.pointer.cY());

        // 特定のラベルが付いているオブジェクトの上には置けないようにする.
        String types[] = {"player", "mob"};
        ArrayList<GameObject> obj = game.findByTypes(types);
        for (int i = 0; i < obj.size(); i++) {
            if (mob.isHitting(obj.get(i))) {
                return;
            }
        };

        // ポテトを消費
        this.potato.consume(mob.cost);

        game.spawn(mob);
        this.se = new Sound("installation");
        this.se.play();
    }

    // 呪文を唱える
    public void castSpell() {
        Mob target_mob = this.bench.focusedMob();
        if (target_mob == null || target_mob.type != "spell" || target_mob.cost > this.potato.currentNum()) {
            return;
        }

        Mob mob = game.factory.generate(target_mob.name, this);
        mob.setCenter(this.pointer.cX(), this.pointer.cY());


        // ポテトを消費
        this.potato.consume(mob.cost);

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
        if (object.type == "bullet" && object.label != "spell") {
            this.destroy();
        }
    }
}
