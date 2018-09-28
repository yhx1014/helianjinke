package org.ht.util;

import java.util.List;

import org.ht.ount.BidCount;
import org.ht.pojo.Product;
import org.ht.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class JobTask {

	@Autowired
	ProductService service;

	@Scheduled(cron = "0 0 1 * * *")
	public void show() {
		BidCount count = new BidCount();
		count.toRaiseMoney();
	}

	@Scheduled(fixedRate = 1000 * 1300000)
	public void print() {
		Product product = new Product();
		List<Product> list2 = service.findList(BeanUtils.toMap(product));
		service.updateProgres(list2);
	}
    
    @Scheduled(fixedRate = 1000*140000)   
    public void Sum(){  
    	
    }  
    
    @Scheduled(fixedRate =1000*15000000)
    public void updateStatus(){
    	Product product=new Product();
		List<Product> list2 = service.findList(BeanUtils.toMap(product));
    	service.updateStatus(list2);
    }
}
