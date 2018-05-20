class FactoryMob {
    public Mob generate(String name, Player player) {
        switch (name) {
            case "three_way_battery":
                return new MobThreeWayBattery(player.direction);
            case "shadow":
                return new MobShadow(player.direction);
            case "merman":
                return new MobMerman(player);
            case "defenser":
                return new MobDefenser(player);
            case "tankpig":
                return new MobTankPig(player);
            case "pin_point_fire":
                return new SpellPinPointFire(player);
            default:
                return new MobBattery(player.direction);
        }
    }
}
