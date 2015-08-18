package com.zhnw.zhnw.project.hour;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.zhnw.hour.Hour;
import com.zhnw.zhnw.project.project.Project;
import com.zhnw.zhnw.purview.user.User;

/**
 * Created by guoyibin on 15/5/4.
 *
 * 项目管理：员工工时
 */
public class HourController extends Controller {

    /**
     * 项目管理主页
     * */
    public void project(){
        User user = getSessionAttr("zhnw_loginUser");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");
        String  selectClientSouName = getPara("selectClientSouName");
        String  selectBTypeSouName = getPara("selectBTypeSouName");
        String  selectContractSouName = getPara("selectContractSouName");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<Project> projectPage  = Project.me.paginate(currentPage, pageSize, selectClientSouName, selectBTypeSouName, selectContractSouName, user);

        setAttr("projectList",projectPage.getList());
        setAttr("totalCount",projectPage.getTotalRow());
        setAttr("totalPage",projectPage.getTotalPage());
        setAttr("pageSize",projectPage.getPageSize());
        setAttr("currentPage",projectPage.getPageNumber());

        setAttr("selectClientSouName",selectClientSouName);
        setAttr("selectBTypeSouName",selectBTypeSouName);
        setAttr("selectContractSouName",selectContractSouName);

        renderJsp("/WEB-INF/content/project/hour/project.jsp");
    }

    /**
     * 工时管理主页
     * */
    public void index(){
        String  projectId = getPara("projectId");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        String  name = getPara("name");



        if (currentPage == null||currentPage.trim().length()==0) currentPage = "1";
        if (pageSize == null||pageSize.trim().length()==0) pageSize = "10";

        Page<Hour> hourPage  = Hour.me.paginate(currentPage, pageSize, projectId, name);

        setAttr("hourList",hourPage.getList());

        setAttr("totalCount",hourPage.getTotalRow());
        setAttr("totalPage",hourPage.getTotalPage());
        setAttr("pageSize",hourPage.getPageSize());
        setAttr("currentPage",hourPage.getPageNumber());

        setAttr("projectId",projectId);
        setAttr("name",name);

        renderJsp("/WEB-INF/content/project/hour/hour.jsp");
    }


    /**
     * 工时批准功能
     * */
    public void agree(){
        String  id = getPara("id");
        new Hour()
                .set("id", id)
                .set("success", "是")
                .update();

        String  projectId = getPara("projectId");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        String  name0 = getPara("name0");



        if (currentPage == null||currentPage.trim().length()==0) currentPage = "1";
        if (pageSize == null||pageSize.trim().length()==0) pageSize = "10";

        Page<Hour> hourPage  = Hour.me.paginate(currentPage, pageSize, projectId, name0);

        setAttr("hourList",hourPage.getList());

        setAttr("totalCount",hourPage.getTotalRow());
        setAttr("totalPage",hourPage.getTotalPage());
        setAttr("pageSize",hourPage.getPageSize());
        setAttr("currentPage",hourPage.getPageNumber());

        setAttr("projectId",projectId);
        setAttr("name",name0);

        renderJsp("/WEB-INF/content/project/hour/hour.jsp");
    }
}
