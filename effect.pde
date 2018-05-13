/**
 * GameObjectのうち、一時的に出現して消えるもの
 */
abstract class Effect extends GameObject {
    public PImage[] frames;
    public int frame_length;
    public String frame_image_name;
    public int frame_idx;

    /**
     * フレーム画像をロードする
     */
    public void load() {
        if (frame_length == 0 || frame_image_name == "") {
            return;
        }
        this.frames = new PImage[this.frame_length];
        for (int i = 0; i < this.frames.length; i ++) {
            this.frames[i] = loadImage("e_" + this.frame_image_name + "_" + i + ".png");
        }
    }

    public void increment() {
        this.frame_idx = this.frame_idx < this.frame_length - 1 ? this.frame_idx + 1 : 0;
    }

    public void update() {
        //
    }

    public void draw() {
        image(this.frames[this.frame_idx], this.x, this.y, this.width, this.height);

        // 最大フレームまで達したら破壊する
        if (this.frame_idx == this.frame_length - 1) {
            this.destroy();
        }
        this.increment();
    }

    public void destroy() {
        this.is_alive = false;
    }
}
