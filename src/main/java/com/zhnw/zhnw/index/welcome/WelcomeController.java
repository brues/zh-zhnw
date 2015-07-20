package com.zhnw.zhnw.index.welcome;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.zhnw.project.project.Project;
import com.zhnw.zhnw.purview.user.User;

import java.text.ParseException;

/**
 * Created by guoyibin on 15/4/8.
 *
 * 欢迎页面
 */
public class WelcomeController extends Controller {


    /**
     * 欢迎页面：展示项目结束后，十天内没有发票的，或者有发票，十天内没有付款的项目
     *
     * */
    public void index() throws ParseException {

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        String  selectClientSouName = getPara("selectClientSouName");
        String  selectBTypeSouName = getPara("selectBTypeSouName");
        String  selectContractSouName = getPara("selectContractSouName");
        String  days = getPara("days");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        if (days == null) days = "10";


        User user = getSessionAttr("zhnw_loginUser");
        Page<Project> projectPage  = Project.me.welcome(currentPage, pageSize, selectClientSouName, selectBTypeSouName, selectContractSouName, days, user);

        setAttr("projectList",projectPage.getList());
        setAttr("totalCount",projectPage.getTotalRow());
        setAttr("totalPage",projectPage.getTotalPage());
        setAttr("pageSize",projectPage.getPageSize());
        setAttr("currentPage",projectPage.getPageNumber());

        setAttr("selectClientSouName",selectClientSouName);
        setAttr("selectBTypeSouName",selectBTypeSouName);
        setAttr("selectContractSouName",selectContractSouName);

        setAttr("days",days);

        renderJsp("/WEB-INF/content/index/welcome/welcome.jsp");
    }
}
