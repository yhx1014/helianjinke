package org.ht.util;

public class UserIDGenerate {
    public static Integer generateID(String defaultID) {
        String s1 = (int) Math.ceil(Math.random() * 10000) + "";
        String s2 = System.currentTimeMillis() % 10000L + "";
        return Integer.parseInt(defaultID + s2 + s1);
    }
}
