package org.ht.service;

import java.util.List;

import org.ht.pojo.Wallet;
import org.springframework.stereotype.Service;

public interface WalletService {
	List<Wallet> querywallets(String userid); 
}
