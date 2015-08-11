package com.zhnw.zhnw.work;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.zhnw.purview.user.User;

/**
 * Created by guoyibin on 15/6/25.
 *
 * 例会管理：工作记录
 */
public class Work extends Model<Work> {

    public static final Work me = new Work();

    /**
     * 分页搜索
     *
     * */
    public Page<Work> paginate(String currentPage, String pageSize, String nameId, String thing, String forecast, String isend, User user) {
        String sql = " from work where zhId="+user.get("zhId")+" ";

        if (nameId!=null&&!nameId.trim().equalsIgnoreCase("")&&!nameId.equalsIgnoreCase("0")){
            sql+=" and nameId="+nameId+" ";
        }

        if (thing!=null&&!thing.trim().equalsIgnoreCase("")&&!thing.trim().equalsIgnoreCase("0")){
            sql+=" and thing='"+thing+"' ";
        }

        if (forecast!=null&&!forecast.trim().equalsIgnoreCase("")&&!forecast.trim().equalsIgnoreCase("0")){
            sql+=" and forecast='"+forecast+"' ";
        }

        if (isend!=null&&!isend.trim().equalsIgnoreCase("")&&!isend.trim().equalsIgnoreCase("0")){
            sql+=" and isend='"+isend+"' ";
        }

        sql+=" order by id desc ";
        return paginate(Integer.parseInt(currentPage), Integer.parseInt(pageSize), " select * ", sql);
    }



    public Page<Work> projectWorkPaginate(String currentPage, String pageSize, String nameId, String thing, String forecast, String isend, User user) {
        String sql = " from work where zhId="+user.get("zhId")+" ";

        if (nameId!=null&&!nameId.trim().equalsIgnoreCase("")&&!nameId.equalsIgnoreCase("0")){
            sql+=" and nameId="+nameId+" ";
        }

        if (thing!=null&&!thing.trim().equalsIgnoreCase("")&&!thing.trim().equalsIgnoreCase("0")){
            sql+=" and thing='"+thing+"' ";
        }

        if (forecast!=null&&!forecast.trim().equalsIgnoreCase("")&&!forecast.trim().equalsIgnoreCase("0")){
            sql+=" and forecast='"+forecast+"' ";
        }

        if (isend!=null&&!isend.trim().equalsIgnoreCase("")&&!isend.trim().equalsIgnoreCase("0")){
            sql+=" and isend='"+isend+"' ";
        }

        //sql+=" and (reviewId="+user.get("id")+" or ("+user.get("id")+" in (select id from user where actorName='管理员' or actorName='超级管理员')))";

        sql+=" order by id desc ";
        return paginate(Integer.parseInt(currentPage), Integer.parseInt(pageSize), " select * ", sql);
    }
}
