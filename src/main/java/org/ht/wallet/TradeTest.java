package org.ht.wallet;
import java.math.BigDecimal;

public class TradeTest {
	 public static void main(String args[]){
	        Trade trade = new Trade();
	        //trade.trasfer("",new BigDecimal(100));
	        trade.trasfer("0xb47571629d9a111ac4dbd112634dfa5c9120bdf1","123456","0x11aa4285e5072e4e4047e39336ce391de6b243d1",new BigDecimal(100));
	 }
}
