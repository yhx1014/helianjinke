package org.ht.wallet;

import org.web3j.protocol.http.HttpService;
import org.web3j.protocol.parity.Parity;
public class ParityClient {
	
	//prot 8545
	
	private static String ip = "http://119.28.108.153:8545";

    private ParityClient(){
    	
    }
    private static class ClientHolder{
        private static final Parity parity = Parity.build(new HttpService(ip));
    }
    
    public static final  Parity getParity(){
        return ClientHolder.parity;
    }
    public static void main(String[] args) {
    	System.out.println(getParity().web3ClientVersion());
	}

}
