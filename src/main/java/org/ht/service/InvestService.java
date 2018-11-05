package org.ht.service;

import java.util.List;
import java.util.Map;

import org.ht.pojo.InvestInfo;

public interface InvestService {
    List<InvestInfo> getAll();
    Integer createInvest(InvestInfo investInfo);
}
