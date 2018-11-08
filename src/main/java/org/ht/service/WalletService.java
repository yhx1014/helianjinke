package org.ht.service;

import java.util.List;

import org.ht.pojo.Wallet;

public interface WalletService {

    List<Wallet> querywallets(Integer userid);

    Wallet queryBalanceByType(String ctype, Integer uid);
}
