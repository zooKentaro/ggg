class SpellPinPointFire extends Mob {
    public int attack;

    public SpellPinPointFire(Player player) {
        this.width = 60;
        this.height = 60;
        this.name = "pin_point_fire";
        this.type = "spell";
        this.cost = 6;
        this.texture = loadImage("t_macarof.png");
        this.attack = 600;
    }

    public void action() {
        Bullet bullet = new BulletPinPointFire(this.x, this.y);
        bullet.attack = this.attack;
        bullet.label = "spell";
        game.spawn(bullet);
        EffectBomNormal effect = new EffectBomNormal();
        effect.x = this.x;
        effect.y = this.y;
        game.spawn(effect);
        bullet.se.play();
    }

    public void update() {
        this.action();
        this.destroy();
    }

    public void draw() {
        //
    }


    public void destroy() {
        this.is_alive = false;
    }
}
