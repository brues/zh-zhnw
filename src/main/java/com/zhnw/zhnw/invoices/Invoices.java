package com.zhnw.zhnw.invoices;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * Created by guoyibin on 15/5/4.
 *
 * 发票
 */
public class Invoices extends Model<Invoices> {
    public static final Invoices me = new Invoices();

    /**
     * 分页搜索查询
     *
     * */
    public Page<Invoices> paginate(String currentPage, String pageSize, String projectId, String sou) {
        String sql = " from invoices where projectId="+projectId+" ";
        if (sou!=null&&sou.trim().length()!=0){
            sql+=" and (invoiceNum like '%"+sou+"%'";
            sql+=" or remark like '%"+sou+"%'";
            sql+=" or type like '%"+sou+"%') ";
        }
        sql+=" order by id desc ";
        return paginate(Integer.parseInt(currentPage), Integer.parseInt(pageSize), " select * ", sql);
    }
}
