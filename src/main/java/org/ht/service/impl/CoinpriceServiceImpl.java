package org.ht.service.impl;

import org.ht.dao.CoinpriceMapper;
import org.ht.pojo.Coinprice;
import org.ht.service.CoinpriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CoinpriceServiceImpl implements CoinpriceService {

    @Autowired
    CoinpriceMapper coinpriceMapper;

    @Override
    public List<Coinprice> getCoinPrice() {
//        return coinpriceMapper.getAll();
        return  coinpriceMapper.getPrice();
    }
}
