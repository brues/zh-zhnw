package com.zhnw.zhnw.project.people;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.zhnw.hour.Hour;
import com.zhnw.zhnw.project.project.Project;
import com.zhnw.zhnw.purview.user.User;

import java.text.ParseException;
import java.util.List;

/**
 * Created by guoyibin on 15/5/4.
 *
 * 项目管理：人员管理
 */
public class PeopleController extends Controller {
    /**
     * 管理主页：项目
     * */
    public void index(){
        User user = getSessionAttr("zhnw_loginUser");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");
        String  selectClientSouName = getPara("selectClientSouName");
        String  selectBTypeSouName = getPara("selectBTypeSouName");
        String  selectContractSouName = getPara("selectContractSouName");

        if (currentPage == null||currentPage.trim().length()==0) currentPage = "1";
        if (pageSize == null||pageSize.trim().length()==0) pageSize = "10";

        Page<Project> projectPage  = Project.me.paginate(currentPage, pageSize, selectClientSouName, selectBTypeSouName, selectContractSouName, user);

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

    /**
     * 项目管理：人员搜索
     * */
    public void people(){
        User user = getSessionAttr("zhnw_loginUser");

        String projectId = getPara("projectId");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null||currentPage.trim().length()==0) currentPage = "1";
        if (pageSize == null||pageSize.trim().length()==0) pageSize = "10";

        Page<ProjectPeople> paginate  = ProjectPeople.me.paginate(currentPage, pageSize, projectId, user);

        setAttr("ppList",paginate.getList());
        setAttr("totalCount",paginate.getTotalRow());
        setAttr("totalPage",paginate.getTotalPage());
        setAttr("pageSize",paginate.getPageSize());
        setAttr("currentPage",paginate.getPageNumber());

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

        Page<ProjectPeople> paginate  = ProjectPeople.me.paginate(currentPage, pageSize, projectId, user);

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
     * ajax:添加人员，判断是否已经存在
     * */
    public void addUserSingle(){
        User user = getSessionAttr("zhnw_loginUser");
        String  projectId = getPara("projectId");
        String  pId = getPara("pId");
        List<ProjectPeople> projectPeopleList = ProjectPeople.me.find("select * from pp where zhId="+user.get("zhId")+" and projectId="+projectId+" and peopleId="+pId);
        if (projectPeopleList.size()==0){
            renderJson("0");
        }else{
            renderJson("1");
        }
    }

    /**
     * 删除
     * */
    public void delete(){
        String id = getPara("id");
        ProjectPeople projectPeople = ProjectPeople.me.findById(id);
        List<Hour> hourList = Hour.me.find("select * from hours where zhId="+projectPeople.get("zhId")+" and projectId="+projectPeople.get("projectId")+" and nameId="+projectPeople.get("peopleId"));
        for (Hour hour : hourList) {
            Hour.me.deleteById(hour.get("id"));
        }
        ProjectPeople.me.deleteById(id);

        User user = getSessionAttr("zhnw_loginUser");

        String projectId = getPara("projectId");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null||currentPage.trim().length()==0) currentPage = "1";
        if (pageSize == null||pageSize.trim().length()==0) pageSize = "10";

        Page<ProjectPeople> paginate  = ProjectPeople.me.paginate(currentPage, pageSize, projectId, user);

        setAttr("ppList",paginate.getList());
        setAttr("totalCount",paginate.getTotalRow());
        setAttr("totalPage",paginate.getTotalPage());
        setAttr("pageSize",paginate.getPageSize());
        setAttr("currentPage",paginate.getPageNumber());

        setAttr("projectId",projectId);

        renderJsp("/WEB-INF/content/project/people/people.jsp");
    }

    /**
     * 更新
     * */
    /*public void update() throws ParseException {
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


        User user = getSessionAttr("zhnw_loginUser");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<ProjectPeople> paginate  = ProjectPeople.me.paginate(currentPage, pageSize, projectId, user);

        setAttr("ppList",paginate.getList());
        setAttr("totalCount",paginate.getTotalRow());
        setAttr("totalPage",paginate.getTotalPage());
        setAttr("pageSize",paginate.getPageSize());
        setAttr("currentPage",paginate.getPageNumber());

        setAttr("peopleId",peopleId);
        setAttr("projectId",projectId);

        renderJsp("/WEB-INF/content/project/people/people.jsp");
    }*/

}
