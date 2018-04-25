Game game;

// Debug Mode
boolean debug = false;

void settings() {
    Config config = debug ? new ConfigDebug() : new ConfigProduction();
    game = new Game(config);
    size(game.config.SCREEN_WIDTH, game.config.SCREEN_HEIGHT);
}

void setup() {
    game.setup();
}

void keyPressed() {
    game.key.is_pressed = true;

    if (keyCode == RIGHT) game.key.right  = true;
    if (keyCode == LEFT)  game.key.left   = true;
    if (keyCode == DOWN)  game.key.down   = true;
    if (keyCode == UP)    game.key.up     = true;
    if (keyCode == ENTER) game.key.enter  = true;
    if (keyCode == ' ')   game.key.space  = true;

    if (keyCode == 'D')   game.key.right2 = true;
    if (keyCode == 'A')   game.key.left2  = true;
    if (keyCode == 'S')   game.key.down2  = true;
    if (keyCode == 'W')   game.key.up2    = true;
    if (keyCode == 'Z')   game.key.enter2 = true;
    if (keyCode == 'X')   game.key.space2 = true;
}

void keyReleased() {
    game.key.is_pressed = false;

    if (keyCode == RIGHT) game.key.right  = false;
    if (keyCode == LEFT)  game.key.left   = false;
    if (keyCode == DOWN)  game.key.down   = false;
    if (keyCode == UP)    game.key.up     = false;
    if (keyCode == ENTER) game.key.enter  = false;
    if (keyCode == ' ')   game.key.space  = false;

    if (keyCode == 'D')   game.key.right2 = false;
    if (keyCode == 'A')   game.key.left2  = false;
    if (keyCode == 'S')   game.key.down2  = false;
    if (keyCode == 'W')   game.key.up2    = false;
    if (keyCode == 'Z')   game.key.enter2 = false;
    if (keyCode == 'X')   game.key.space2 = false;
}

void draw() {
    background(game.config.BACKGROUND_RESET_COLOR);
    game.play();
}
