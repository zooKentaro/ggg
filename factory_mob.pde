class FactoryMob {
    public Mob generate(String name, Player player) {
        switch (name) {
            case "three_way_battery":
                return new MobThreeWayBattery(player.direction);
            case "shadow":
                return new MobShadow(player.direction);
            case "merman":
                return new MobMerman(player.direction);
            case "tankpig":
                return new MobTankPig(player);
            default:
                return new MobBattery(player.direction);
        }
    }
}
