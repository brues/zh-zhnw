package com.zhnw.zhnw.purview.actor;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;

/**
 * Created by guoyibin on 15/4/8.
 */
public class Actor extends Model<Actor> {
    public static final Actor me = new Actor();

    public Page<Actor> paginate(String currentPage, String pageSize, String actorName) {
        String sql = " from actor where 1=1 ";
        if (actorName!=null&&!actorName.trim().equalsIgnoreCase("")){
            sql+=" and actorName='"+actorName+"'";
        }
        sql+=" order by id desc ";
        return paginate(Integer.parseInt(currentPage), Integer.parseInt(pageSize), " select * ", sql);
    }

    public boolean quchongfu(String name) {
        List<Actor> actors = find("select * from actor where actorName='"+name+"'");
        if (actors.size()>0)
            return true;
        return false;
    }

    public boolean quchongfuupdate(String id, String name) {
        List<Actor> actors = find("select * from actor where id!="+id+" and actorName='"+name+"'");
        if (actors.size()>0)
            return true;
        return false;
    }
}
