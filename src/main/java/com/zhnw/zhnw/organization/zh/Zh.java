package com.zhnw.zhnw.organization.zh;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * Created by guoyibin on 15/7/3.
 *
 * 机构
 */
public class Zh extends Model<Zh> {
    public static final Zh me = new Zh();


    /**
     * 分页查询机构信息
     * */
    public Page<Zh> paginate(String currentPage, String pageSize, String souContent) {
        String sql = " from zh where 1=1 ";

        if (souContent!=null&&!souContent.equalsIgnoreCase("")){
            sql+=" and (comName like '%"+souContent+"%' or shortName like '%"+souContent+"%' or address like '%"+souContent+"%' ) ";
        }

        sql+=" order by id ";
        return paginate(Integer.parseInt(currentPage), Integer.parseInt(pageSize), " select * ", sql);
    }

}
