package com.zhnw.zhnw.project.project;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.util.DateUtil;
import com.zhnw.util.ProjectUtil;
import com.zhnw.zhnw.businesstype.BusinessType;
import com.zhnw.zhnw.clientcompany.ClientCompany;
import com.zhnw.zhnw.purview.user.User;

import java.text.ParseException;
import java.util.Date;

/**
 * Created by guoyibin on 15/4/27.
 *
 * 项目管理控制器
 */
public class ProjectController extends Controller {

    /**
     * 管理主页
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

        renderJsp("/WEB-INF/content/project/project/project.jsp");
    }

    /**
     * 添加
     * */
    public void add() throws ParseException {
        User user = getSessionAttr("zhnw_loginUser");

        String  clientId = getPara("clientName");//客户名称id
        String  clientName = ClientCompany.me.findById(clientId).get("comName");//客户名称name

        String  contacts = getPara("contacts");//项目负责人name
        Long  contactsId = ((User)getSessionAttr("zhnw_loginUser")).get("id");//项目负责人id

        String  beginDate = getPara("beginDate");//开始日期
        String  endDate = getPara("endDate");//结束日期

        String  businessTypeId = getPara("businessType");//业务类型id
        String  businessTypeName = BusinessType.me.findById(businessTypeId).get("name");//业务类型name
        String  businessTypeEnName = BusinessType.me.findById(businessTypeId).get("enName");//业务类型enName

        String  contractMoney = getPara("contractMoney");//合同金额
        String  isPigeonhole = getPara("isPigeonhole");//是否归档

        DateUtil dateUtil = new DateUtil();
        ProjectUtil projectUtil = new ProjectUtil();

        Project project = new Project();
        project .set("clientName", clientName)//客户名称
                .set("contacts", contacts)//项目负责人
                .set("businessType", businessTypeName)//业务类型
                .set("contractNum", projectUtil.getNewProjectContractNum(businessTypeEnName, Long.parseLong(businessTypeId), user))//合同编号
                .set("registerDate", new Date())//登记日期
                .set("contractMoney", contractMoney)//合同金额
                .set("isPigeonhole", isPigeonhole)//是否归档
                .set("clientId", clientId)//客户Id
                .set("contactId", contactsId)//项目负责人Id
                .set("businessTypeId", businessTypeId)//业务类型Id
                .set("zhId", user.get("zhId"));//业务类型Id
        if (beginDate!=null&&!beginDate.equals("")){
            project.set("beginDate", dateUtil.stringToDate("yyyy-MM-dd", beginDate));//开始日期
        }
        if (endDate!=null&&!endDate.equals("")){
            project.set("endDate", dateUtil.stringToDate("yyyy-MM-dd", endDate));//结束日期
        }
        project.save();




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
        setAttr("selectContractSouName", selectContractSouName);

        renderJsp("/WEB-INF/content/project/project/project.jsp");

    }

    /**
     * 删除
     * */
    public void delete(){
        String id = getPara("id");
        Project.me.deleteById(id);
        redirect("/project");
    }



    /**
     * 更新
     * */
    public void update() throws ParseException {
        String id = getPara("id");
        String  clientId = getPara("clientName");//客户名称id
        String  clientName = ClientCompany.me.findById(clientId).get("comName");//客户名称name

        String  contacts = getPara("contacts");//项目负责人name
        Long  contactsId = ((User)getSessionAttr("zhnw_loginUser")).get("id");//项目负责人id

        String  beginDate = getPara("beginDate");//开始日期
        String  endDate = getPara("endDate");//结束日期

        String  businessTypeId = getPara("businessType");//业务类型id
        String  businessTypeName = BusinessType.me.findById(businessTypeId).get("name");//业务类型name
        String  businessTypeEnName = BusinessType.me.findById(businessTypeId).get("enName");//业务类型enName

        String  contractMoney = getPara("contractMoney");//合同金额
        String  isPigeonhole = getPara("isPigeonhole");//是否归档


        DateUtil dateUtil = new DateUtil();

        Project project = new Project();
        project.set("id",id)
                .set("clientName", clientName)//客户名称
                .set("contacts", contacts)//项目负责人
                .set("businessType", businessTypeName)//业务类型
                .set("registerDate", new Date())//登记日期
                .set("contractMoney", contractMoney)//合同金额
                .set("isPigeonhole", isPigeonhole)//是否归档
                .set("clientId", clientId)//客户Id
                .set("contactId", contactsId)//项目负责人Id
                .set("businessTypeId", businessTypeId);//业务类型Id
        if (beginDate!=null&&!beginDate.equals("")){
            project.set("beginDate", dateUtil.stringToDate("yyyy-MM-dd", beginDate));//开始日期
        }
        if (endDate!=null&&!endDate.equals("")){
            project.set("endDate", dateUtil.stringToDate("yyyy-MM-dd", endDate));//结束日期
        }
        project.update();




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

        renderJsp("/WEB-INF/content/project/project/project.jsp");
    }

    /**
     * 更新合同编号
     * */
    public void updateNum(){
        String  id = getPara("id");
        String  contractNum = getPara("contractNum");
        new Project().set("id", id)
                .set("contractNum", contractNum)
                .update();
        redirect("/project");
    }
}
