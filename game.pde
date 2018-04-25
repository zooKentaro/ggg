class Game {
    // 設定
    public Config config;
    // 現在のシーン
    public Scene current_scene;
    // スタートシーン
    protected Scene scene_start;
    // メインシーン
    protected Scene scene_main;
    // クリアシーン
    protected Scene scene_clear;
    // ゲームオーバーシーン
    protected Scene scene_over;
    // keyを受付
    public Key key;
    // タイムレコーダー
    public TimeRecorder recoder;
    // ファクトリ
    public FactoryUnit factory;
    // フィールド
    public Field field;

    // ゲーム内に登場する全てのオブジェクトを格納する配列
    public GameObject objects[];

    public Game(Config config) {
        this.config = config;
    }

    /**
     * ゲームをセットアップする
     */
    public void setup() {
        // 各シーンを作成しておく
        this.scene_start = new SceneStart();
        this.scene_main = new SceneMain();
        this.scene_clear = new SceneClear();
        this.scene_over = new SceneOver();

        // keyを初期化
        this.key = new Key();

        // オブジェクト配列初期化
        this.objects = new GameObject[game.config.MAX_OBJECT_NUM];

        // タイムレコーダーを初期化
        this.recoder = new TimeRecorder();

        // ファクトリを初期化
        this.factory = new FactoryUnit();

        // フィールド初期化
        this.field = new Field();

        // スタート画面で初期化
        this.changeScene(SceneNum.START);
    }

    /**
     * ゲームを描画する
     */
    public void play() {
        this.current_scene.draw();
    }

    /**
     * シーン番号を受け取り、現在のシーンをその番号のシーンに切り替える
     * @param int scene_num シーン番号
     * @return void
     */
    public void changeScene(int scene_num) {
        switch (scene_num) {
            case SceneNum.START:
                this.current_scene = this.scene_start;
                break;
            case SceneNum.MAIN:
                this.current_scene = this.scene_main;
                break;
            case SceneNum.CLEAR:
                this.current_scene = this.scene_clear;
                break;
            case SceneNum.OVER:
                this.current_scene = this.scene_over;
                break;
        }
        this.current_scene.setup();
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

    /**
     * 指定されたラベルを持つGameobjectを全て取得する
     */
    public ArrayList<GameObject> findByLabels(String[] labels) {
        ArrayList<GameObject> obj = new ArrayList<GameObject>();
        for (int i = 0; i < labels.length; i++) {
            for (int j = 0; j < this.objects.length; j++) {
                if (this.objects[j] == null) continue;
                if (this.objects[j].label.equals(labels[i]) && this.objects[j].is_alive == true) {
                    obj.add(this.objects[j]);
                }
            }
        }
        return obj;
    }

    /**
     * 指定されたタイプを持つGameobjectを全て取得する
     */
    public ArrayList<GameObject> findByTypes(String[] types) {
        ArrayList<GameObject> obj = new ArrayList<GameObject>();
        for (int i = 0; i < types.length; i++) {
            for (int j = 0; j < this.objects.length; j++) {
                if (this.objects[j] == null) continue;
                if (this.objects[j].type.equals(types[i]) && this.objects[j].is_alive == true) {
                    obj.add(this.objects[j]);
                }
            }
        }
        return obj;
    }
}
