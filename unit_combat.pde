class UnitCombat extends Unit {
    public int action_interval_ms;

    public UnitCombat() {
        this.width = 40;
        this.height = 40;
        this.action_interval_ms = 9999;
    }

    public void update() {
        // タイムレコーダに格納するキー, 他のユニットとはインスタンスのハッシュ値で区別する
        String key = "UNIT_COMBAT_ACTION_" + this.hashCode();

        if (game.recoder.get(key) == 0) {
            game.recoder.set(key, this.action_interval_ms);
            this.action();
        }
    }

    public void action() {
        //
    }
}
