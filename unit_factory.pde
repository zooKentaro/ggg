class UnitFactory {
    public Unit generate(String name, String direction) {
        switch (name) {
            case "battery":
                return new Battery(direction);
            case "three_way_battery":
                return new ThreeWayBattery(direction);
            default:
                return new Unit();
        }
    }
}
