package utils;

public class NV {
    public static boolean isInteger(String str) {
        try {
            Integer.parseInt(str);
        } catch (NumberFormatException e) {
            return false;
        }
        return true;
    }

    public static boolean isDouble(String str) {
        try {
            Double.parseDouble(str);
        } catch (NumberFormatException e) {
            return false;
        }
        return true;
    }

    public static boolean isXIntegerOrHalf(String str) {
        String[] numbers = {"-2", "-1.5", "-1", "-0.5", "0", "0.5", "1", "1.5", "2"};
        for (String i : numbers) {
            if (i.equals(str)) {
                return true;
            }
        }
        return false;
    }

    public static boolean isRInRange(String str) {
        String[] numbers = {"1", "2", "3", "4", "5"};
        for (String i : numbers) {
            if (i.equals(str)) {
                return true;
            }
        }
        return false;
    }
    public static boolean isValidNumbers(String x, String y, String r) {
        return isXIntegerOrHalf(x) && isDouble(y) && isRInRange(r);
    }
    public static boolean isValidNumbersFromCanvas(String x, String y, String r) {
        return isDouble(x) && isDouble(y) && isRInRange(r);
    }
}
