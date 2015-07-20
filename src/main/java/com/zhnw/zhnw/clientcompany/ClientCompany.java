package com.zhnw.zhnw.clientcompany;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.zhnw.purview.user.User;

/**
 * Created by guoyibin on 15/4/24.
 */
public class ClientCompany extends Model<ClientCompany> {
    public static final ClientCompany me = new ClientCompany();

    public Page<ClientCompany> paginate(String currentPage, String pageSize, String comName, String address, User user) {
        String sql = " from clientcompany where zhId="+user.get("zhId")+" ";
        if (comName!=null&&!comName.trim().equalsIgnoreCase("")){
            sql+=" and comName like '%"+comName.trim()+"%'";
        }
        if (address!=null&&!address.trim().equalsIgnoreCase("")){
            sql+=" and address like '%"+address.trim()+"%'";
        }
        sql+=" order by id desc ";
        return paginate(Integer.parseInt(currentPage), Integer.parseInt(pageSize), " select * ", sql);
    }
}
