package org.ht.wallet;
import java.io.IOException;

import org.web3j.protocol.Web3j;
import org.web3j.protocol.http.HttpService;
public class Web3JClient {
	//private static String ip = "http://localhost:8545/";
	//geth --datadir "./" --rpc  --rpcaddr "0.0.0.0" --rpcport "8545" --rpcapi "db,eth,net,web3,miner,personal"   console 2>>geth.log
	private static String ip = "http://119.28.108.153:8545";
    public Web3JClient(){
    }
    private volatile static Web3j web3j;
    public static Web3j getClient(){
        if(web3j==null){
            synchronized (Web3JClient.class){
                if(web3j==null){
                	web3j = Web3j.build(new HttpService(ip));
                	 String web3ClientVersion;
					try {
						web3ClientVersion = web3j.web3ClientVersion().send().getWeb3ClientVersion();
	                	System.out.println("version_info"+web3ClientVersion);
					} catch (IOException e) {
						e.printStackTrace();
					}
                }
            }
        }
        return web3j;
    }
    public static void main(String[] args) throws IOException {
    	getClient();
	}
}
