Game game;

void settings() {
    size(Config.SCREEN_WIDTH, Config.SCREEN_HEIGHT);
}

void setup() {
    game = new Game();
    game.setup();
}

 void keyPressed() {
        if (keyCode == RIGHT)  game.key.right = true;
        if (keyCode == LEFT)   game.key.left  = true;
        if (keyCode == DOWN)   game.key.down  = true;
        if (keyCode == UP)     game.key.up    = true;
    }

    void keyReleased() {
        if (keyCode == RIGHT)  game.key.right  = false;
        if (keyCode == LEFT)   game.key.left   = false;
        if (keyCode == DOWN)   game.key.down   = false;
        if (keyCode == UP)     game.key.up     = false;
    }

void draw() {
    background(Config.BACKGROUND_RESET_COLOR);
    game.play();
}
