/**
 * GameObjectのうち、何かを装備したりできるもの
 */
abstract class Mob extends GameObject {
    public boolean lock_up    = false;
    public boolean lock_down  = false;
    public boolean lock_right = false;
    public boolean lock_left  = false;
    public int cost;
    public int hp = 1;
    public String direction;

    public void onHit(GameObject object) {
        switch (object.type) {
            case "bullet":
                Bullet bullet = (Bullet)object;
                this.hp -= bullet.attack;
                object.destroy();
                break;
        }

        if (this.hp <= 0) {
            this.destroy();
        }
    }

    public void unlock() {
        this.lock_left  = false;
        this.lock_right = false;
        this.lock_up    = false;
        this.lock_down  = false;
    }

    /**
     * ディレクションを設定する
     */
    public Mob setDirection(String direction) {
        this.direction = direction;
        return this;
    }
}
