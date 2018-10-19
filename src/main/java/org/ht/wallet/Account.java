package org.ht.wallet;

import java.io.IOException;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.junit.Test;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.DefaultBlockParameter;
import org.web3j.protocol.core.DefaultBlockParameterNumber;
import org.web3j.protocol.core.methods.response.EthGetBalance;
import org.web3j.protocol.parity.Parity;
import org.web3j.protocol.parity.methods.response.NewAccountIdentifier;
import org.web3j.protocol.parity.methods.response.PersonalAccountsInfo;
import org.web3j.utils.Convert;

public class Account {
	  private static  Parity parity = ParityClient.getParity();
	  private static Web3j web3j = Web3JClient.getClient();
	  
	  public List<String> getAccountlist(){
	        try{
	            return  parity.personalListAccounts().send().getAccountIds();
	        }catch (Exception e){
	            e.printStackTrace();
	        }
	        return null;
	    }
	  
	    public String createAccount(String accountName,String password,AccountInfo accountInfo){
	        try {
	            NewAccountIdentifier newAccountIdentifier = parity.personalNewAccount(password).send();
	            if(newAccountIdentifier!=null){
	                String accountId = newAccountIdentifier.getAccountId();
	                parity.personalSetAccountName(accountId,accountName);
	                Map<String,Object> account = new HashMap<String,Object>();
	                account.put(accountId,accountInfo);
	                parity.personalSetAccountMeta(accountId,account);
	                return  accountId;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return null;
	    }

	    public PersonalAccountsInfo.AccountsInfo getAccountInfo(String accountId){

	        try{
	            PersonalAccountsInfo personalAccountsInfo = parity.personalAccountsInfo().send();

	            return  personalAccountsInfo.getAccountsInfo().get(accountId);
	        }catch (Exception e){
	            e.printStackTrace();
	        }
	        return null;
	    }

	    public BigInteger getBalance(String accountId){
	        try {
	            DefaultBlockParameter defaultBlockParameter = new DefaultBlockParameterNumber(web3j.ethBlockNumber().send().getBlockNumber());
	            System.out.println(web3j);
	            EthGetBalance ethGetBalance =  parity.ethGetBalance(accountId,defaultBlockParameter).send();
	            if(ethGetBalance!=null){
	                return ethGetBalance.getBalance();
	            }
	        }catch (Exception e){
	            e.printStackTrace();
	        }
	        return null;
	    }
	    
	    @Test
	    public void getBlanceOf() throws IOException {
	        if (web3j == null) return;
	        String address = "0x41F1dcbC0794BAD5e94c6881E7c04e4F98908a87";
	        EthGetBalance balance = web3j.ethGetBalance(address, DefaultBlockParameter.valueOf("latest")).send();
	        String blanceETH = Convert.fromWei(balance.getBalance().toString(), Convert.Unit.ETHER).toPlainString().concat(" ether");
	        System.out.println(blanceETH);
	        //log.info(blanceETH);
	    }
}
