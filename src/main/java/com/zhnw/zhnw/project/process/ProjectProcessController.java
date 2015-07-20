package com.zhnw.zhnw.project.process;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.zhnw.project.project.Project;
import com.zhnw.zhnw.purview.user.User;

import java.text.ParseException;
import java.util.Date;

/**
 * Created by guoyibin on 15/5/6.
 *
 *
 */
public class ProjectProcessController extends Controller {

    /**
     * 项目
     * */
    public void project(){

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

        renderJsp("/WEB-INF/content/project/process/project.jsp");
    }

    /**
     * 管理主页
     * */
    public void index(){
        String  projectId = getPara("projectId");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        String  souContent = getPara("souContent");

        if (currentPage == null||currentPage.trim().length()==0) currentPage = "1";
        if (pageSize == null||pageSize.trim().length()==0) pageSize = "10";

        Page<ProjectProcess> projectProcessPage  = ProjectProcess.me.paginate(currentPage, pageSize, souContent, projectId);

        setAttr("processList",projectProcessPage.getList());

        setAttr("totalCount",projectProcessPage.getTotalRow());
        setAttr("totalPage",projectProcessPage.getTotalPage());
        setAttr("pageSize",projectProcessPage.getPageSize());
        setAttr("currentPage",projectProcessPage.getPageNumber());

        setAttr("souContent",souContent);
        setAttr("projectId",projectId);

        renderJsp("/WEB-INF/content/project/process/process.jsp");
    }

    /**
     * 添加
     * */
    public void add() throws ParseException {
        String  projectId = getPara("projectId");

        String  dates = getPara("dates");
        String  work = getPara("work");
        String  result = getPara("result");
        String  waitok = getPara("waitok");
        String  principalId = getPara("principalId");
        String  principal = "";
        if (principalId!=null&&!principalId.trim().equalsIgnoreCase("")){
            principal = User.me.findById(Long.parseLong(principalId)).get("trueName");
        }
        String  reviewerId = getPara("reviewerId");
        String  reviewer = "";
        if (reviewerId!=null&&!reviewerId.trim().equalsIgnoreCase("")){
            reviewer = User.me.findById(Long.parseLong(reviewerId)).get("trueName");
        }
        String  remark = getPara("remark");

        new ProjectProcess()
                .set("dates", dates)
                .set("work", work)
                .set("result", result)
                .set("waitok", waitok)
                .set("principalId", principalId)
                .set("principal", principal)
                .set("reviewerId", reviewerId)
                .set("reviewer", reviewer)
                .set("remark", remark)
                .set("projectId", projectId)
                .set("remarkDate", new Date())
                .save();







        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        String  souContent = getPara("souContent");

        if (currentPage == null||currentPage.trim().length()==0) currentPage = "1";
        if (pageSize == null||pageSize.trim().length()==0) pageSize = "10";

        Page<ProjectProcess> projectProcessPage  = ProjectProcess.me.paginate(currentPage, pageSize, souContent, projectId);

        setAttr("processList",projectProcessPage.getList());

        setAttr("totalCount",projectProcessPage.getTotalRow());
        setAttr("totalPage",projectProcessPage.getTotalPage());
        setAttr("pageSize",projectProcessPage.getPageSize());
        setAttr("currentPage",projectProcessPage.getPageNumber());

        setAttr("souContent",souContent);
        setAttr("projectId",projectId);

        renderJsp("/WEB-INF/content/project/process/process.jsp");
    }

    /**
     * 删除
     * */
    public void delete(){
        String id = getPara("id");
        ProjectProcess.me.deleteById(id);






        String  projectId = getPara("projectId");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        String  souContent = getPara("souContent");

        if (currentPage == null||currentPage.trim().length()==0) currentPage = "1";
        if (pageSize == null||pageSize.trim().length()==0) pageSize = "10";

        Page<ProjectProcess> projectProcessPage  = ProjectProcess.me.paginate(currentPage, pageSize, souContent, projectId);

        setAttr("processList",projectProcessPage.getList());

        setAttr("totalCount",projectProcessPage.getTotalRow());
        setAttr("totalPage",projectProcessPage.getTotalPage());
        setAttr("pageSize",projectProcessPage.getPageSize());
        setAttr("currentPage",projectProcessPage.getPageNumber());

        setAttr("souContent",souContent);
        setAttr("projectId",projectId);

        renderJsp("/WEB-INF/content/project/process/process.jsp");
    }

    /**
     * 更新
     * */
    public void update() throws ParseException {
        String  projectId = getPara("projectId");
        String  id = getPara("id");

        String  dates = getPara("dates");
        String  work = getPara("work");
        String  result = getPara("result");
        String  waitok = getPara("waitok");
        String  principalId = getPara("principalId");
        String  principal = "";
        if (principalId!=null&&!principalId.trim().equalsIgnoreCase("")){
            principal = User.me.findById(Long.parseLong(principalId)).get("trueName");
        }
        String  reviewerId = getPara("reviewerId");
        String  reviewer = "";
        if (reviewerId!=null&&!reviewerId.trim().equalsIgnoreCase("")){
            reviewer = User.me.findById(Long.parseLong(reviewerId)).get("trueName");
        }
        String  remark = getPara("remark");

        new ProjectProcess()
                .set("dates", dates)
                .set("work", work)
                .set("result", result)
                .set("waitok", waitok)
                .set("principalId", principalId)
                .set("principal", principal)
                .set("reviewerId", reviewerId)
                .set("reviewer", reviewer)
                .set("remark", remark)
                .set("projectId", projectId)
                .set("id", id)
                .set("remarkDate", new Date())
                .update();







        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        String  souContent = getPara("souContent");

        if (currentPage == null||currentPage.trim().length()==0) currentPage = "1";
        if (pageSize == null||pageSize.trim().length()==0) pageSize = "10";

        Page<ProjectProcess> projectProcessPage  = ProjectProcess.me.paginate(currentPage, pageSize, souContent, projectId);

        setAttr("processList",projectProcessPage.getList());

        setAttr("totalCount",projectProcessPage.getTotalRow());
        setAttr("totalPage",projectProcessPage.getTotalPage());
        setAttr("pageSize",projectProcessPage.getPageSize());
        setAttr("currentPage",projectProcessPage.getPageNumber());

        setAttr("souContent",souContent);
        setAttr("projectId",projectId);

        renderJsp("/WEB-INF/content/project/process/process.jsp");
    }
}
