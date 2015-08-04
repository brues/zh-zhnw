package com.zhnw.zhnw.clientcompany;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.zhnw.project.project.Project;
import com.zhnw.zhnw.purview.user.User;

import java.util.List;

/**
 * Created by guoyibin on 15/4/24.
 */
public class ClientCompanyController extends Controller {
    /**
     * 客户资料管理主页
     * */
    public void index(){
        User user = getSessionAttr("zhnw_loginUser");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        String  comName = getPara("comName");
        String  address = getPara("address");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<ClientCompany> clientCompanyPage = ClientCompany.me.paginate(currentPage, pageSize, comName, address, user);
        setAttr("clientCompanyList",clientCompanyPage.getList());
        setAttr("totalCount",clientCompanyPage.getTotalRow());
        setAttr("totalPage",clientCompanyPage.getTotalPage());
        setAttr("pageSize",clientCompanyPage.getPageSize());
        setAttr("currentPage",clientCompanyPage.getPageNumber());
        setAttr("comName",comName);
        setAttr("address",address);

        renderJsp("/WEB-INF/content/clientcompany/clientCompany.jsp");
    }

    /**
     * 删除客户资料
     * */
    public void delete(){

        String id = getPara("id");
        ClientCompany.me.deleteById(id);

        User user = getSessionAttr("zhnw_loginUser");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        String  souname = getPara("souname");
        String  souaddress = getPara("souaddress");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<ClientCompany> clientCompanyPage = ClientCompany.me.paginate(currentPage, pageSize, souname, souaddress, user);
        setAttr("clientCompanyList",clientCompanyPage.getList());
        setAttr("totalCount",clientCompanyPage.getTotalRow());
        setAttr("totalPage",clientCompanyPage.getTotalPage());
        setAttr("pageSize",clientCompanyPage.getPageSize());
        setAttr("currentPage",clientCompanyPage.getPageNumber());
        setAttr("comName",souname);
        setAttr("address",souaddress);

        renderJsp("/WEB-INF/content/clientcompany/clientCompany.jsp");
    }

    /**
     * 添加客户
     * */
    public void add(){
        User user = getSessionAttr("zhnw_loginUser");
        String  comName = getPara("comName");
        String  address = getPara("address");
        new ClientCompany()
                .set("comName", comName)
                .set("address", address)
                .set("zhId", user.get("zhId"))
                .save();




        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        String  souname = getPara("souname");
        String  souaddress = getPara("souaddress");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<ClientCompany> clientCompanyPage = ClientCompany.me.paginate(currentPage, pageSize, souname, souaddress, user);
        setAttr("clientCompanyList",clientCompanyPage.getList());
        setAttr("totalCount",clientCompanyPage.getTotalRow());
        setAttr("totalPage",clientCompanyPage.getTotalPage());
        setAttr("pageSize",clientCompanyPage.getPageSize());
        setAttr("currentPage",clientCompanyPage.getPageNumber());
        setAttr("comName",souname);
        setAttr("address",souaddress);

        renderJsp("/WEB-INF/content/clientcompany/clientCompany.jsp");
    }

    /**
     * 更新客户
     * */
    public void update(){
        String  id = getPara("id");
        String  comName = getPara("comName");
        String  address = getPara("address");
        new ClientCompany().set("id", id)
                .set("comName", comName)
                .set("address", address)
                .update();

        /* 更新合同信息里的客户信息 */
        List<Project> projectList = Project.me.find("select * from project where clientId=" + id);
        for (Project project : projectList) {
            project.set("clientName",comName).update();
        }


        User user = getSessionAttr("zhnw_loginUser");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        String  souname = getPara("souname");
        String  souaddress = getPara("souaddress");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<ClientCompany> clientCompanyPage = ClientCompany.me.paginate(currentPage, pageSize, souname, souaddress, user);
        setAttr("clientCompanyList",clientCompanyPage.getList());
        setAttr("totalCount",clientCompanyPage.getTotalRow());
        setAttr("totalPage",clientCompanyPage.getTotalPage());
        setAttr("pageSize",clientCompanyPage.getPageSize());
        setAttr("currentPage",clientCompanyPage.getPageNumber());
        setAttr("comName",souname);
        setAttr("address",souaddress);

        renderJsp("/WEB-INF/content/clientcompany/clientCompany.jsp");
    }

    /**
     *
     * ajax获取客户列表
     * */
    public void clientJson(){
        User user = getSessionAttr("zhnw_loginUser");
        List<ClientCompany> clients = ClientCompany.me.find("select * from clientcompany where zhId="+user.get("zhId")+" order by id desc");
        renderJson(clients);
    }

    /**
     *
     * ajax获取客户列表：根据公司名称
     * */
    public void nameJson(){
        User user = getSessionAttr("zhnw_loginUser");
        String  comName = getPara("name");
        List<ClientCompany> clients = ClientCompany.me.find("select * from clientcompany where zhId="+user.get("zhId")+" and comName='"+comName.trim()+"' order by id desc");
        renderJson(clients);
    }

    /**
     *
     * ajax获取客户列表：根据公司名称和id
     * */
    public void updateNameJson(){
        User user = getSessionAttr("zhnw_loginUser");
        String  comName = getPara("name");
        String  id = getPara("id");
        List<ClientCompany> clients = ClientCompany.me.find("select * from clientcompany where zhId="+user.get("zhId")+" and comName='"+comName.trim()+"' and id!="+id+" ");
        renderJson(clients);
    }
}
