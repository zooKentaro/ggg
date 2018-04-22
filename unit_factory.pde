class UnitFactory {
    public Unit generate(String name, String direction) {
        switch (name) {
            case "battery":
                return new Battery(direction);
            default:
                return new Unit();
        }
    }
}
