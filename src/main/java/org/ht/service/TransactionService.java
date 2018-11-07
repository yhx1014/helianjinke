package org.ht.service;

import java.util.List;

import org.ht.pojo.Transaction;


public interface TransactionService {
    List<Transaction> getAll(Integer uid);
}
