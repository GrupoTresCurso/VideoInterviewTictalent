package beans;

import java.util.Arrays;

public class HelperBeans {

    public static String getStringFromArray(String[] arrayStrings) {
        String stringFromArray = Arrays.toString(arrayStrings);
        return quitarCorchetes(stringFromArray);
    }
    public static String[] getArrayFromString(String arrayStrings) {
        return arrayStrings.split(",");
    }

    private static String quitarCorchetes(String stringFromArray) {
        return stringFromArray.replace("[","").replace("]","");
    }

}
