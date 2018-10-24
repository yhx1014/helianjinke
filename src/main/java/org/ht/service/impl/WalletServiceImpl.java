package org.ht.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.ht.dao.WalletDao;
import org.ht.pojo.Wallet;
import org.ht.service.WalletService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WalletServiceImpl implements WalletService {
	@Autowired
	private WalletDao walletdao;

	public List<Wallet> querywallets(String userid) {
		return walletdao.queryWallets(userid);
	}

}
