package org.ht.service.impl;

import org.ht.dao.InvestInfoDao;
import org.ht.pojo.InvestInfo;
import org.ht.service.InvestService;
import org.ht.util.DateUtil;
import org.ht.util.TrimCountUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class InvestServiceImpl implements InvestService {

    @Autowired
    private InvestInfoDao investInfoDao;

    @Override
    public List<InvestInfo> getAll() {
        List<InvestInfo> result = investInfoDao.getAll();
        for (InvestInfo ii : result) {
            ii.setBorrowCount(TrimCountUtil.trimCount(ii.getBorrowCount()));
            ii.setCollateralCount(TrimCountUtil.trimCount(ii.getCollateralCount()));
            if (ii.getCreatetime() != null)
                ii.setFormatTime(DateUtil.formatToString(ii.getCreatetime()));
        }
        return result;
    }

    @Override
    public Integer createInvest(InvestInfo investInfo) {
        investInfo.setPaytype("还本付息");
        investInfo.setCreatetime(new Date());
        investInfoDao.insertSelective(investInfo);
        return 1;
    }
}
