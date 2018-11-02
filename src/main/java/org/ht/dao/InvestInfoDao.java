package org.ht.dao;

import org.ht.pojo.InvestInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InvestInfoDao {
    int deleteByPrimaryKey(Integer id);

    int insert(InvestInfo record);

    int insertSelective(InvestInfo record);

    InvestInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(InvestInfo record);

    int updateByPrimaryKey(InvestInfo record);

    List<InvestInfo> getAll();
}