package com.zhnw.zhnw.clientcompany;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.zhnw.purview.user.User;

/**
 * Created by guoyibin on 15/7/14.
 */
public class ClientPeople extends Model<ClientPeople> {
    public static final ClientPeople me = new ClientPeople();

    public Page<ClientPeople> paginate(String currentPage, String pageSize, User user, String clientId) {
        String sql = " from clientpeople where zhId="+user.get("zhId")+" and clientId="+clientId+" ";
        sql+=" order by id desc ";
        return paginate(Integer.parseInt(currentPage), Integer.parseInt(pageSize), " select * ", sql);
    }
}
