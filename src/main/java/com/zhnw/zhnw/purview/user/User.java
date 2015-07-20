package com.zhnw.zhnw.purview.user;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;

/**
 * Created by guoyibin on 15/4/8.
 *
 * 用户管理 实体类
 */
public class User extends Model<User> {
    public static final User me = new User();

    public Page<User> paginate(String currentPage, String pageSize, String userName, String trueName, String actorName) {
        String sql = " from user where 1=1 ";
        if (userName!=null&&!userName.trim().equalsIgnoreCase("")){
            sql+=" and userName like '%"+userName+"%'";
        }

        if (trueName!=null&&!trueName.trim().equalsIgnoreCase("")){
            sql+=" and trueName like '%"+trueName+"%'";
        }

        if (actorName!=null&&!actorName.trim().equalsIgnoreCase("")){
            sql+=" and actorName like '%"+actorName+"%'";
        }
        sql+=" order by id desc ";
        return paginate(Integer.parseInt(currentPage), Integer.parseInt(pageSize), " select * ", sql);
    }

    public boolean quchongfu(String name) {
        List<User> users = find("select * from user where userName='"+name+"'");
        if (users.size()>0)
            return true;
        return false;
    }

    public boolean quchongfuupdate(String id, String name) {
        List<User> users = find("select * from user where id!="+id+" and userName='"+name+"'");
        if (users.size()>0)
            return true;
        return false;
    }
}
