package org.ht.util;

public class TrimCountUtil {
    /**
     * 将币的数量结果截取小数点后4位
     * @param coinCount
     * @return
     */
    public static String trimCount(String coinCount){
        return String.format("%.4f", Double.parseDouble(coinCount));
    }
}
