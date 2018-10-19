package org.ht.wallet;

import java.math.BigDecimal;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.web3j.protocol.core.methods.request.Transaction;
import org.web3j.protocol.core.methods.response.EthSendTransaction;
import org.web3j.protocol.parity.Parity;

public class Trade {
	private static final Logger logger = LoggerFactory.getLogger(Trade.class);

    //private static BigInteger nonce = new BigInteger("0");
    //private static BigInteger gasPrice = new BigInteger("1");
    //private static BigInteger gasLimit = new BigInteger("50");

    private Parity parity = ParityClient.getParity();

    public boolean trasfer(String accountId,String passsword,String toAccountId, BigDecimal amount)  {

        Transaction transaction = Transaction.createEtherTransaction(accountId,null,null,null,toAccountId,amount.toBigInteger());
        try{
            EthSendTransaction ethSendTransaction =parity.personalSignAndSendTransaction(transaction,passsword).send();
            if(ethSendTransaction!=null){
                String tradeHash = ethSendTransaction.getTransactionHash();
                logger.info("",accountId,toAccountId,tradeHash);
            }
        }catch (Exception e){
            logger.error("",accountId,e);
        }
        return false;
    }

}
