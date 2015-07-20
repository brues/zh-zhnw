package com.zhnw.zhnw.project.invoices;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.zhnw.invoices.Invoices;
import com.zhnw.zhnw.project.project.Project;

/**
 * Created by guoyibin on 15/5/4.
 */
public class InvoicesController extends Controller {
    /**
     * 管理主页
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

        renderJsp("/WEB-INF/content/project/invoices/project.jsp");
    }

    /**
     * 管理主页
     * */
    public void index(){
        String  projectId = getPara("projectId");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        String  sou = getPara("sou");



        if (currentPage == null||currentPage.trim().length()==0) currentPage = "1";
        if (pageSize == null||pageSize.trim().length()==0) pageSize = "10";

        Page<Invoices> invoicesPage  = Invoices.me.paginate(currentPage, pageSize, projectId, sou);

        setAttr("invoicesList",invoicesPage.getList());

        setAttr("totalCount",invoicesPage.getTotalRow());
        setAttr("totalPage",invoicesPage.getTotalPage());
        setAttr("pageSize",invoicesPage.getPageSize());
        setAttr("currentPage",invoicesPage.getPageNumber());

        setAttr("projectId",projectId);
        setAttr("sou",sou);

        renderJsp("/WEB-INF/content/project/invoices/invoices.jsp");
    }
}
