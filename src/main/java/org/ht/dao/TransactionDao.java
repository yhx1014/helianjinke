package org.ht.dao;

import org.ht.pojo.Transaction;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface TransactionDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Transaction record);

    int insertSelective(Transaction record);

    Transaction selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Transaction record);

    int updateByPrimaryKey(Transaction record);

    List<Transaction> getAll(Integer userid);
}