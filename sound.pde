/**
 * 音声を出力する
 */
class Sound {
    AudioPlayer player;

    Sound(String name) {
        this.player = game.factory_sound.generate(name);
    }

    /**
     * 音声を再生し、巻き戻す
     */
    public void play() {
        this.player.play();
        this.player.rewind();
    }

    //音声を繰り返し再生する
    public void loop() {
        this.player.loop();
    }
}
