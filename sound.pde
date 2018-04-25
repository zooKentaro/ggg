/**
 * 音声を出力する
 */
class Sound {
    AudioPlayer player;

    Sound(String name) {
        this.player = minim.loadFile(name);
    }

    /**
     * 音声を再生し、巻き戻す
     */
    public void play() {
        this.player.play();
        this.player.rewind();
    }
}
