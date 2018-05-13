/**
 * サウンドのプレイヤーの数を制御しながら生成する
 */
class FactorySound {
    // bgm
    protected AudioPlayer[] bgm_main;

    // fire_heavy
    protected AudioPlayer[] fire_heavy;
    protected int fire_heavy_idx;

    public FactorySound() {
        this.bgm_main = this.load(new AudioPlayer[1], "bgm_main.mp3");
        this.fire_heavy = this.load(new AudioPlayer[game.config.SE_PLAYER_LIMIT_FIRE_HEAVY], "se_fire_heavy.mp3");
    }

    public AudioPlayer generate(String name) {
        switch (name) {
            case "bgm_main":
                return this.bgm_main[0];
            case "fire_heavy":
                this.fire_heavy_idx = this.increment(this.fire_heavy_idx, game.config.SE_PLAYER_LIMIT_FIRE_HEAVY);
                return this.fire_heavy[this.fire_heavy_idx];
            default:
                return null;
        }
    }

    /**
     * 音声を読み込む
     */
    public AudioPlayer[] load(AudioPlayer[] ap, String se_name) {
        for (int i = 0; i < ap.length; i++) {
            ap[i] = minim.loadFile(se_name);
        }
        return ap;
    }

    /**
     * idxをインクリメントしてプレイヤーを切り替えるようにする
     */
    public int increment(int idx, int limit) {
        return idx < limit - 1 ? idx + 1 : 0;
    }
}
