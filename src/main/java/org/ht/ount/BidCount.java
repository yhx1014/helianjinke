package org.ht.ount;

import org.ht.service.BidService;
import org.ht.service.impl.BidServiceImpl;

public class BidCount {
	BidService bid = new BidServiceImpl();

	public void toRaiseMoney() {
		bid.chuli();
	}
	
	public void to() {
		bid.chuli2();
	}

}
