class FactoryMob {
    public Mob generate(String name, String direction) {
        switch (name) {
            case "three_way_battery":
                return new MobThreeWayBattery(direction);
            case "shadow":
                return new MobShadow(direction);
            case "merman":
                return new MobMerman(direction);
            case "defenser":
                return new MobDefenser(direction);
            default:
                return new MobBattery(direction);
        }
    }
}
