package com.zhnw.zhnw.organization.zhMan;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * Created by guoyibin on 15/7/3.
 *
 *
 */
public class ZhMan extends Model<ZhMan> {
    public static final ZhMan me = new ZhMan();

    public Page<ZhMan> paginate(String currentPage, String pageSize, String zhId) {
        String sql = " from zhMan where zhId="+zhId+" ";
        sql+=" order by id desc ";
        return paginate(Integer.parseInt(currentPage), Integer.parseInt(pageSize), " select * ", sql);
    }
}
