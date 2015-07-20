package com.zhnw.zhnw.hour;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * Created by guoyibin on 15/5/4.
 *
 * 工时
 */
public class Hour extends Model<Hour> {
    public static final Hour me = new Hour();

    public Page<Hour> paginate(String currentPage, String pageSize, String projectId, String name) {
        String sql = " from hours where projectId="+projectId+" ";
        if (name!=null&&name.trim().length()!=0){
            sql+=" and name like '%"+name+"%'";
        }
        sql+=" order by id desc ";
        return paginate(Integer.parseInt(currentPage), Integer.parseInt(pageSize), " select * ", sql);
    }
}
