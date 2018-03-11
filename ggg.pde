Game game;

void settings() {
    size(Config.SCREEN_WIDTH, Config.SCREEN_HEIGHT);
}

void setup() {
    game = new Game();
    game.setup();
}

void draw() {
    background(Config.BACKGROUND_RESET_COLOR);
    game.play();
}
