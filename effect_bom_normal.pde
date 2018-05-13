class EffectBomNormal extends Effect {
    public EffectBomNormal() {
        this.width = 40;
        this.height = 40;
        this.name = "bom_normal";
        this.type = "effect";

        this.frame_length = 7;
        this.frame_image_name = "bom_normal";

        // フレーム画像読み込み
        this.load();
    }
}
