class MobCombat extends Mob {
    public int action_interval_ms;

    public void update() {
        // タイムレコーダに格納するキー, 他のユニットとはインスタンスのハッシュ値で区別する
        String key = "MOB_COMBAT_ACTION_" + this.hashCode();

        if (game.recoder.get(key) == 0) {
            game.recoder.set(key, this.action_interval_ms);
            this.action();
        }
    }

    public void action() {
        //
    }

    public void draw() {
        //
    }

    @Override
    public void destroy() {
        this.is_alive = false;
    }
}
