class UnitFactory {
    public Unit generate(String code) {
        switch (code) {
            case "a1":
                return new UnitSimple();
            default:
                return new Unit();
        }
    }
}
