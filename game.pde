class Game {
    // 現在のシーン
    public Scene current_scene;
    // スタートシーン
    protected Scene start_scene;
    // メインシーン
    protected Scene main_scene;
    // クリアシーン
    protected Scene clear_scene;
    // ゲームオーバーシーン
    protected Scene over_scene;
    // keyを受付
    public Key key;

    // ゲーム内に登場する全てのオブジェクトを格納する配列
    public GameObject objects[];

    /**
     * ゲームをセットアップする
     */
    public void setup() {
        // 各シーンを作成しておく
        this.start_scene = new StartScene();
        this.main_scene = new MainScene();
        this.clear_scene = new ClearScene();
        this.over_scene = new OverScene();

        // keyを初期化
        this.key = new Key();

        // オブジェクト配列初期化
        this.objects = new GameObject[Config.MAX_OBJECT_NUM];

        // スタート画面で初期化
        this.changeScene(SceneNum.START);
    }

    /**
     * ゲームを描画する
     */
    public void play() {
        this.current_scene.draw(this);
    }

    /**
     * シーン番号を受け取り、現在のシーンをその番号のシーンに切り替える
     * @param int scene_num シーン番号
     * @return void
     */
    public void changeScene(int scene_num) {
        switch (scene_num) {
            case SceneNum.START:
                this.current_scene = this.start_scene;
                break;
            case SceneNum.MAIN:
                this.current_scene = this.main_scene;
                break;
            case SceneNum.CLEAR:
                this.current_scene = this.clear_scene;
                break;
            case SceneNum.OVER:
                this.current_scene = this.over_scene;
                break;
        }
        this.current_scene.setup(this);
    }

    /**
     * game.objects 配列内の空いている(nullまたはis_alive == falseである)スペースに
     * 与えられた object を挿入する
     * => Config.MAX_OBJECT_NUM を超える場合は格納されない
     */
    public void spawn(GameObject object) {
        for (int i = 0; i < this.objects.length; i++) {
            if (this.objects[i] == null || this.objects[i].is_alive == false) {
                this.objects[i] = object;
                return;
            }
        }
    }
}
