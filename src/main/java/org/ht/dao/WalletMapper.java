package org.ht.dao;

import org.ht.pojo.Wallet;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WalletMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Wallet record);

    int insertSelective(Wallet record);

    Wallet selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Wallet record);

    int updateByPrimaryKey(Wallet record);

    List<Wallet> queryWallets(Integer userid);
}