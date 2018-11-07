package org.ht.service.impl;

import org.ht.dao.TransactionDao;
import org.ht.pojo.Transaction;
import org.ht.service.TransactionService;
import org.ht.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class TransactionServiceImpl implements TransactionService {
    @Autowired
    TransactionDao transactionDao;

    @Override
    public List<Transaction> getAll(Integer uid) {
        List<Transaction> result = transactionDao.getAll(uid);
        for (Transaction tx : result) {
            tx.setFormatTime(DateUtil.formateDatetosecond(tx.getStartTime()));
        }
        return result;
    }
}
