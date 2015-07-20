package com.zhnw.zhnw.project.project;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.util.DateUtil;
import com.zhnw.zhnw.purview.user.User;

import java.text.ParseException;

/**
 * Created by guoyibin on 15/4/27.
 *
 * 项目管理
 */
public class Project extends Model<Project> {
    public static final Project me = new Project();

    public Page<Project> paginate(String currentPage, String pageSize, String selectClientSouName, String selectBTypeSouName, String selectContractSouName) {
        String sql = " from project where 1=1 ";
        if (selectClientSouName!=null&&selectClientSouName.trim().length()!=0&&!selectClientSouName.trim().equals("0")){
            sql+=" and clientId="+selectClientSouName+"";
        }
        if (selectBTypeSouName!=null&&selectBTypeSouName.trim().length()!=0&&!selectBTypeSouName.trim().equals("0")){
            sql+=" and businessTypeId="+selectBTypeSouName+"";
        }
        if (selectContractSouName!=null&&selectContractSouName.trim().length()!=0&&!selectContractSouName.trim().equals("0")){
            sql+=" and contactId="+selectContractSouName+"";
        }
        sql+=" order by id desc ";
        return paginate(Integer.parseInt(currentPage), Integer.parseInt(pageSize), " select * ", sql);
    }

    public Page<Project> unpaid (String currentPage, String pageSize, String selectClientSouName, String selectBTypeSouName, String selectContractSouName, String days, User user) throws ParseException {

        DateUtil dateUtil = new DateUtil();
        String pass = dateUtil.passThroughDays(Integer.parseInt(days));

        String sql = " from project p where p.zhId = "+user.get("zhId")+" and ((p.id in(select b.projectId from invoices b where b.isCharge='否' and b.billingDate<'"+pass+"')) " +
                " or (p.id not in(select a.projectId from invoices a) and p.endDate is not null and p.endDate<'"+pass+"')) ";

        if (selectClientSouName!=null&&selectClientSouName.trim().length()!=0&&!selectClientSouName.trim().equals("0")){
            sql+=" and clientId="+selectClientSouName+" ";
        }
        if (selectBTypeSouName!=null&&selectBTypeSouName.trim().length()!=0&&!selectBTypeSouName.trim().equals("0")){
            sql+=" and businessTypeId="+selectBTypeSouName+" ";
        }
        if (selectContractSouName!=null&&selectContractSouName.trim().length()!=0&&!selectContractSouName.trim().equals("0")){
            sql+=" and contactId="+selectContractSouName+" ";
        }

        sql+=" order by id desc ";
        return paginate(Integer.parseInt(currentPage), Integer.parseInt(pageSize), " select * ", sql);
    }
}
