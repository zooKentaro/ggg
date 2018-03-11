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

    /**
     * ゲームをセットアップする
     */
    public void setup() {
        // 各シーンを作成しておく
        this.start_scene = new StartScene();
        this.main_scene = new MainScene();
        this.clear_scene = new ClearScene();
        this.over_scene = new OverScene();

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
        }
    }
}
