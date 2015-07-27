package com.zhnw.zhnw.purview.actor;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.zhnw.purview.user.User;

import java.util.List;

/**
 * Created by guoyibin on 15/4/8.
 *
 * 角色
 */
public class Actor extends Model<Actor> {
    public static final Actor me = new Actor();

    /**
     * 分页查询
     *
     * */
    public Page<Actor> paginate(String currentPage, String pageSize, User user) {
        String sql = " from actor where zhId="+user.get("zhId")+" ";
        sql+=" order by id desc ";
        return paginate(Integer.parseInt(currentPage), Integer.parseInt(pageSize), " select * ", sql);
    }
}
