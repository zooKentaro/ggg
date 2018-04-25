class FactoryUnit {
    public Unit generate(String name, String direction) {
        switch (name) {
            case "battery":
                return new UnitBattery(direction);
            case "three_way_battery":
                return new UnitThreeWayBattery(direction);
            default:
                return new Unit();
        }
    }
}
