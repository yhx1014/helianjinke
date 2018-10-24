package org.ht.dao;

import java.util.List;

import org.ht.pojo.Wallet;

public interface WalletDao {
	List<Wallet> queryWallets(String uid);
}
