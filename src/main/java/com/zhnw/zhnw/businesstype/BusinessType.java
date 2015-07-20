package com.zhnw.zhnw.businesstype;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.zhnw.purview.user.User;

/**
 * Created by guoyibin on 15/4/24.
 *
 * 业务类型
 */
public class BusinessType extends Model<BusinessType> {
    public static final BusinessType me = new BusinessType();

    public Page<BusinessType> paginate(String currentPage, String pageSize, String name, String enName, User user) {
        String sql = " from businesstype where zhId="+user.get("zhId")+" ";
        if (name!=null&&!name.trim().equalsIgnoreCase("")){
            sql+=" and name like '%"+name+"%'";
        }
        if (enName!=null&&!enName.trim().equalsIgnoreCase("")){
            sql+=" and enName like '%"+enName+"%'";
        }
        sql+=" order by id desc ";
        return paginate(Integer.parseInt(currentPage), Integer.parseInt(pageSize), " select * ", sql);
    }
}
