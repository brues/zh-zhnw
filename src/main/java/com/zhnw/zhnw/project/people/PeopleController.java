package com.zhnw.zhnw.project.people;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.zhnw.project.project.Project;
import com.zhnw.zhnw.purview.user.User;

import java.text.ParseException;

/**
 * Created by guoyibin on 15/5/4.
 */
public class PeopleController extends Controller {
    /**
     * 管理主页
     * */
    public void index(){

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");
        String  selectClientSouName = getPara("selectClientSouName");
        String  selectBTypeSouName = getPara("selectBTypeSouName");
        String  selectContractSouName = getPara("selectContractSouName");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<Project> projectPage  = Project.me.paginate(currentPage, pageSize, selectClientSouName, selectBTypeSouName, selectContractSouName);

        setAttr("projectList",projectPage.getList());
        setAttr("totalCount",projectPage.getTotalRow());
        setAttr("totalPage",projectPage.getTotalPage());
        setAttr("pageSize",projectPage.getPageSize());
        setAttr("currentPage",projectPage.getPageNumber());

        setAttr("selectClientSouName",selectClientSouName);
        setAttr("selectBTypeSouName",selectBTypeSouName);
        setAttr("selectContractSouName",selectContractSouName);

        renderJsp("/WEB-INF/content/project/people/project.jsp");
    }

    public void people(){
        String projectId = getPara("projectId");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        String  peopleId = getPara("peopleId");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<ProjectPeople> paginate  = ProjectPeople.me.paginate(currentPage, pageSize, peopleId, projectId);

        setAttr("ppList",paginate.getList());
        setAttr("totalCount",paginate.getTotalRow());
        setAttr("totalPage",paginate.getTotalPage());
        setAttr("pageSize",paginate.getPageSize());
        setAttr("currentPage",paginate.getPageNumber());

        setAttr("peopleId",peopleId);
        setAttr("projectId",projectId);

        renderJsp("/WEB-INF/content/project/people/people.jsp");
    }

    /**
     * 添加
     * */
    public void add() throws ParseException {
        User user = getSessionAttr("zhnw_loginUser");

        String  projectId = getPara("projectId");//项目Id

        String  peopleId = getPara("peopleId");//项目负责人Id
        String trueName = User.me.findById(peopleId).getStr("trueName");

        new ProjectPeople()
                .set("projectId", projectId)//项目Id
                .set("peopleId", peopleId)//人员Id
                .set("name", trueName)//人员真实姓名
                .set("zhId", user.get("zhId"))//人员真实姓名
                .save();



        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<ProjectPeople> paginate  = ProjectPeople.me.paginate(currentPage, pageSize, peopleId, projectId);

        setAttr("ppList",paginate.getList());
        setAttr("totalCount",paginate.getTotalRow());
        setAttr("totalPage",paginate.getTotalPage());
        setAttr("pageSize",paginate.getPageSize());
        setAttr("currentPage",paginate.getPageNumber());

        setAttr("peopleId",peopleId);
        setAttr("projectId",projectId);

        renderJsp("/WEB-INF/content/project/people/people.jsp");
    }

    /**
     * 删除
     * */
    public void delete(){
        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";
        String id = getPara("id");
        ProjectPeople.me.deleteById(id);
        setAttr("currentPage",currentPage);
        setAttr("pageSize",pageSize);
        redirect("/project/people/people");
    }

    /**
     * 更新
     * */
    public void update() throws ParseException {
        String  id = getPara("id");//Id
        String  projectId = getPara("projectId");//项目Id
        String  peopleId = getPara("peopleId");//项目负责人Id
        String trueName = User.me.findById(peopleId).getStr("trueName");

        new ProjectPeople()
                .set("id", id)
                .set("projectId", projectId)//项目Id
                .set("peopleId", peopleId)//人员Id
                .set("name", trueName)//人员真实姓名
                .update();



        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<ProjectPeople> paginate  = ProjectPeople.me.paginate(currentPage, pageSize, peopleId, projectId);

        setAttr("ppList",paginate.getList());
        setAttr("totalCount",paginate.getTotalRow());
        setAttr("totalPage",paginate.getTotalPage());
        setAttr("pageSize",paginate.getPageSize());
        setAttr("currentPage",paginate.getPageNumber());

        setAttr("peopleId",peopleId);
        setAttr("projectId",projectId);

        renderJsp("/WEB-INF/content/project/people/people.jsp");
    }

}
