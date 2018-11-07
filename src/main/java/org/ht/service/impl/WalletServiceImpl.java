package org.ht.service.impl;

import java.util.List;


import org.ht.dao.WalletMapper;
import org.ht.pojo.Wallet;
import org.ht.service.WalletService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WalletServiceImpl implements WalletService {
	@Autowired
	private WalletMapper walletMapper;

	public List<Wallet> querywallets(Integer userid) {
		return walletMapper.queryWallets(userid);
	}

}
