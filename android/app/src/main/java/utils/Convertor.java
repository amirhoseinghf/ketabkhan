package utils;

import java.util.HashMap;

public class Convertor {
    public static HashMap<String,String> stringToMap(String str) {
        String[] exprs = str.split(",,");
        HashMap<String,String> data = new HashMap<>();

        for (String expr : exprs){
            int colon = expr.indexOf(':');
            String key = expr.substring(0,colon);
            String value = expr.substring(colon + 1);
        }
        return data;
    }
}
