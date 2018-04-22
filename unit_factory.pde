class UnitFactory {
    public Unit generate(String code) {
        switch (code) {
            case "a1":
                return new UnitSimple();
            case "b1":
                return new Battery();
            default:
                return new Unit();
        }
    }
}
