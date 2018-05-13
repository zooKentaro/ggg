class FactoryMob {
    public Mob generate(String name, String direction) {
        switch (name) {
            case "three_way_battery":
                return new MobThreeWayBattery(direction);
            case "merman":
                return new MobMerman(direction);
            default:
                return new MobBattery(direction);
        }
    }
}
