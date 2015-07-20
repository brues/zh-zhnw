package com.zhnw.zhnw.clientcompany;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.zhnw.purview.user.User;

/**
 * Created by guoyibin on 15/7/14.
 */
public class ClientPeopleController extends Controller {
    /**
     * 客户联系人管理主页
     * */
    public void index(){
        User user = getSessionAttr("zhnw_loginUser");

        String clientId = getPara("clientId");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<ClientPeople> clientPeoplePage = ClientPeople.me.paginate(currentPage, pageSize, user, clientId);
        setAttr("clientPeopleList",clientPeoplePage.getList());
        setAttr("totalCount",clientPeoplePage.getTotalRow());
        setAttr("totalPage",clientPeoplePage.getTotalPage());
        setAttr("pageSize",clientPeoplePage.getPageSize());
        setAttr("currentPage",clientPeoplePage.getPageNumber());

        setAttr("clientId",clientId);

        renderJsp("/WEB-INF/content/clientcompany/clientPeople.jsp");
    }

    /**
     * 添加客户联系人
     * */
    public void add() {
        User user = getSessionAttr("zhnw_loginUser");
        String clientId = getPara("clientId");

        String name = getPara("name");
        String work = getPara("work");
        String tel = getPara("tel");
        String phone = getPara("phone");
        String email = getPara("email");
        new ClientPeople()
                .set("name", name)
                .set("work", work)
                .set("tel", tel)
                .set("phone", phone)
                .set("email", email)
                .set("clientId", Long.parseLong(clientId))
                .set("zhId", user.get("zhId"))
                .save();


        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<ClientPeople> clientPeoplePage = ClientPeople.me.paginate(currentPage, pageSize, user, clientId);
        setAttr("clientPeopleList",clientPeoplePage.getList());
        setAttr("totalCount",clientPeoplePage.getTotalRow());
        setAttr("totalPage",clientPeoplePage.getTotalPage());
        setAttr("pageSize",clientPeoplePage.getPageSize());
        setAttr("currentPage",clientPeoplePage.getPageNumber());

        setAttr("clientId",clientId);

        renderJsp("/WEB-INF/content/clientcompany/clientPeople.jsp");
    }

    /**
     * 删除客户联系人
     * */
    public void delete(){

        String id = getPara("id");
        ClientPeople.me.deleteById(id);

        User user = getSessionAttr("zhnw_loginUser");

        String clientId = getPara("clientId");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<ClientPeople> clientPeoplePage = ClientPeople.me.paginate(currentPage, pageSize, user, clientId);
        setAttr("clientPeopleList",clientPeoplePage.getList());
        setAttr("totalCount",clientPeoplePage.getTotalRow());
        setAttr("totalPage",clientPeoplePage.getTotalPage());
        setAttr("pageSize",clientPeoplePage.getPageSize());
        setAttr("currentPage",clientPeoplePage.getPageNumber());

        setAttr("clientId",clientId);

        renderJsp("/WEB-INF/content/clientcompany/clientPeople.jsp");
    }

    /**
     * 更新客户联系人
     * */
    public void update(){
        String  id = getPara("id");

        String name = getPara("name");
        String work = getPara("work");
        String tel = getPara("tel");
        String phone = getPara("phone");
        String email = getPara("email");

        new ClientPeople().set("id", id)
                .set("name", name)
                .set("work", work)
                .set("tel", tel)
                .set("phone", phone)
                .set("email", email)
                .update();

        User user = getSessionAttr("zhnw_loginUser");

        String clientId = getPara("clientId");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<ClientPeople> clientPeoplePage = ClientPeople.me.paginate(currentPage, pageSize, user, clientId);
        setAttr("clientPeopleList",clientPeoplePage.getList());
        setAttr("totalCount",clientPeoplePage.getTotalRow());
        setAttr("totalPage",clientPeoplePage.getTotalPage());
        setAttr("pageSize",clientPeoplePage.getPageSize());
        setAttr("currentPage",clientPeoplePage.getPageNumber());

        setAttr("clientId",clientId);

        renderJsp("/WEB-INF/content/clientcompany/clientPeople.jsp");
    }
}
