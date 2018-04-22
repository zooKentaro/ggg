class UnitFactory {
    public Unit generate(String name) {
        switch (name) {
            case "battery":
                return new Battery();
            default:
                return new Unit();
        }
    }
}
