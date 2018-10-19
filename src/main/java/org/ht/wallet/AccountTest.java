package org.ht.wallet;

import java.math.BigInteger;
import java.util.List;

import org.junit.Test;

public class AccountTest {
    public static void main(String args[]) {
    	String address="0x1a1df36658989eaf2873527f351d969c969ba166";
    	getBalance(address);
    	//queryAccount();
    }
    
    public static void getBalance(String address){
        Account account = new Account();
        //BigInteger ba = account.getBalance("0x1a1df36658989eaf2873527f351d969c969ba166");
        BigInteger ba = account.getBalance(address);
        System.out.print(ba);
    }
    
    public static void queryAccount(){
        Account account = new Account();
        List<String> accounts = account.getAccountlist();
        for(String accountId:accounts){
            System.out.println(accountId);
        }

    }

    @Test
    public void createAccount(){
            Account account = new Account();
            AccountInfo accountInfo = new AccountInfo();
            accountInfo.setPhone("17710239369");
            accountInfo.setAddress("yuhongxue");
            accountInfo.setSchool("buaa");
            accountInfo.setUserName("yhx");
            String accountId = account.createAccount("yuhongxue","123456",accountInfo);
            System.out.println("xxx:"+accountId);
            //PersonalAccountsInfo.AccountsInfo accountsInfo = account.getAccountInfo("0x11aa4285e5072e4e4047e39336ce391de6b243d1");
            //System.out.println(accountsInfo.toString());
    }
}
