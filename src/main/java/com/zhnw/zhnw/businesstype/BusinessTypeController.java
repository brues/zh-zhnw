package com.zhnw.zhnw.businesstype;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.zhnw.purview.user.User;

import java.util.List;

/**
 * Created by guoyibin on 15/4/24.
 *
 *
 */
public class BusinessTypeController extends Controller {

    /**
     * 业务类型管理主页
     * */
    public void index(){
        User user = getSessionAttr("zhnw_loginUser");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");
        String  name = getPara("name");
        String  enName = getPara("enName");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<BusinessType> businessTypePage = BusinessType.me.paginate(currentPage, pageSize, name, enName, user);
        setAttr("businessTypeList",businessTypePage.getList());
        setAttr("totalCount",businessTypePage.getTotalRow());
        setAttr("totalPage",businessTypePage.getTotalPage());
        setAttr("pageSize",businessTypePage.getPageSize());
        setAttr("currentPage",businessTypePage.getPageNumber());
        setAttr("name",name);
        setAttr("enName",enName);

        renderJsp("/WEB-INF/content/businesstype/businessType.jsp");
    }

    /**
     * 删除业务类型
     * */
    public void delete(){
        String id = getPara("id");
        BusinessType.me.deleteById(id);


        User user = getSessionAttr("zhnw_loginUser");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");
        String  name = getPara("name");
        String  enName = getPara("enName");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<BusinessType> businessTypePage = BusinessType.me.paginate(currentPage, pageSize, name, enName, user);
        setAttr("businessTypeList",businessTypePage.getList());
        setAttr("totalCount",businessTypePage.getTotalRow());
        setAttr("totalPage",businessTypePage.getTotalPage());
        setAttr("pageSize",businessTypePage.getPageSize());
        setAttr("currentPage",businessTypePage.getPageNumber());
        setAttr("name",name);
        setAttr("enName",enName);

        renderJsp("/WEB-INF/content/businesstype/businessType.jsp");
    }

    /**
     * 添加业务类型
     * */
    public void add(){
        User user = getSessionAttr("zhnw_loginUser");
        String  name = getPara("name");
        String  enName = getPara("enName");
        new BusinessType()
                .set("name", name)
                .set("enName", enName)
                .set("zhId", user.get("zhId"))
                .save();



        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");
        String  name2 = getPara("name2");
        String  enName2 = getPara("enName2");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<BusinessType> businessTypePage = BusinessType.me.paginate(currentPage, pageSize, name2, enName2, user);
        setAttr("businessTypeList",businessTypePage.getList());
        setAttr("totalCount",businessTypePage.getTotalRow());
        setAttr("totalPage",businessTypePage.getTotalPage());
        setAttr("pageSize",businessTypePage.getPageSize());
        setAttr("currentPage",businessTypePage.getPageNumber());
        setAttr("name",name2);
        setAttr("enName",enName2);

        renderJsp("/WEB-INF/content/businesstype/businessType.jsp");
    }

    /**
     * 更新业务类型资料
     * */
    public void update(){
        String  id = getPara("id");
        String  name = getPara("name");
        String  enName = getPara("enName");
        new BusinessType().set("id", id)
                .set("name", name)
                .set("enName", enName)
                .update();


        User user = getSessionAttr("zhnw_loginUser");
        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");
        String  name2 = getPara("name2");
        String  enName2 = getPara("enName2");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<BusinessType> businessTypePage = BusinessType.me.paginate(currentPage, pageSize, name2, enName2, user);
        setAttr("businessTypeList",businessTypePage.getList());
        setAttr("totalCount",businessTypePage.getTotalRow());
        setAttr("totalPage",businessTypePage.getTotalPage());
        setAttr("pageSize",businessTypePage.getPageSize());
        setAttr("currentPage",businessTypePage.getPageNumber());
        setAttr("name",name2);
        setAttr("enName",enName2);

        renderJsp("/WEB-INF/content/businesstype/businessType.jsp");
    }


    /**
     *
     * ajax获取列表
     * */
    public void btypeJson(){
        User user = getSessionAttr("zhnw_loginUser");
        List<BusinessType> businessTypes = BusinessType.me.find("select * from businesstype where zhId="+user.get("zhId")+" order by id desc");
        renderJson(businessTypes);
    }


    /**
     *
     * ajax获取列表
     * */
    public void nameJson(){
        String  name = getPara("name");
        User user = getSessionAttr("zhnw_loginUser");
        List<BusinessType> businessTypes = BusinessType.me.find("select * from businesstype where zhId="+user.get("zhId")+" and name ='"+name+"' order by id desc");
        if (businessTypes.size()==0)
            renderJson("0");
        else
            renderJson("1");
    }

    /**
     *
     * ajax获取列表
     * */
    public void enNameJson(){
        String  enName = getPara("enName");
        User user = getSessionAttr("zhnw_loginUser");
        List<BusinessType> businessTypes = BusinessType.me.find("select * from businesstype where zhId="+user.get("zhId")+" and enName ='"+enName+"' order by id desc");
        if (businessTypes.size()==0)
            renderJson("0");
        else
            renderJson("1");
    }


    /**
     *
     * ajax获取列表
     * */
    public void updateNameJson(){
        String  name = getPara("name");
        String  id = getPara("id");
        User user = getSessionAttr("zhnw_loginUser");
        List<BusinessType> businessTypes = BusinessType.me.find("select * from businesstype where zhId="+user.get("zhId")+" and name ='"+name+"' and id!="+id+" order by id desc");
        if (businessTypes.size()==0)
            renderJson("0");
        else
            renderJson("1");
    }

    /**
     *
     * ajax获取列表
     * */
    public void updateEnNameJson(){
        String  enName = getPara("enName");
        String  id = getPara("id");
        User user = getSessionAttr("zhnw_loginUser");
        List<BusinessType> businessTypes = BusinessType.me.find("select * from businesstype where zhId="+user.get("zhId")+" and enName ='"+enName+"' and id!="+id+" order by id desc");
        if (businessTypes.size()==0)
            renderJson("0");
        else
            renderJson("1");
    }
}
