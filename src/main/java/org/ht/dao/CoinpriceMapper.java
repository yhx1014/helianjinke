package org.ht.dao;

import org.ht.pojo.Coinprice;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CoinpriceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Coinprice record);

    int insertSelective(Coinprice record);

    Coinprice selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Coinprice record);

    int updateByPrimaryKey(Coinprice record);

    List<Coinprice> getAll();

    List<Coinprice> getPrice();
}