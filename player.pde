class Player extends Mob implements ControllerInterface {
    public int speed = 4;
    public int break_time_ms = 500;

    @Override
    protected void update() {
        // 操作する
        controll();
    }

    // ユニットを配置する
    public void putUnit() {
        Unit unit = (Unit)(game.factory.generate("battery").set(this.x + this.width, this.y));

        // 特定のラベルが付いているオブジェクトの上には置けないようにする.
        String labels[] = {"player", "unit"};
        ArrayList<GameObject> obj = game.findByLabels(labels);
        for (int i = 0; i < obj.size(); i++) {
            if (unit.isHitting(obj.get(i))) {
                return;
            }
        };
        game.spawn(unit);
    }

    @Override
    protected void draw() {
        image(this.texture, this.x, this.y, this.width, this.height);
    }

    @Override
    public void destroy() {
        this.is_alive = false;
    }

    public void controll() {
        //
    }

    protected String getUnitTimerKey() {
        return "PUT_UNIT_" + this.hashCode();
    }

    public void onHit(GameObject object) {
        if (object.type == "bullet") {
            this.destroy();
        }
    }
}
