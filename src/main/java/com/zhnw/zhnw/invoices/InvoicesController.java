package com.zhnw.zhnw.invoices;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.zhnw.project.project.Project;

import java.text.ParseException;

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

        renderJsp("/WEB-INF/content/invoices/project.jsp");
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

        renderJsp("/WEB-INF/content/invoices/invoices.jsp");
    }

    /**
     * 添加
     * */
    public void add() throws ParseException {
        String  projectId = getPara("projectId");

        String  billingDate = getPara("billingDate");
        String  invoiceNum = getPara("invoiceNum");
        String  chargeDate = getPara("chargeDate");
        String  isCharge = getPara("isCharge");
        String  type = getPara("type");
        String  remark = getPara("remark");
        String  money = getPara("money");


        new Invoices()
                .set("billingDate", billingDate)
                .set("invoiceNum", invoiceNum)
                .set("chargeDate", chargeDate)
                .set("isCharge", isCharge)
                .set("type", type)
                .set("remark", remark)
                .set("money", money)
                .set("projectId", projectId)
                .save();

        redirect("/invoice");
    }

    /**
     * 删除
     * */
    public void delete(){
        String id = getPara("id");
        Invoices.me.deleteById(id);
        redirect("/invoice");
    }

    /**
     * 更新
     * */
    public void update() throws ParseException {
        String  id = getPara("id");

        String  billingDate = getPara("billingDate");
        String  invoiceNum = getPara("invoiceNum");
        String  chargeDate = getPara("chargeDate");
        String  isCharge = getPara("isCharge");
        String  type = getPara("type");
        String  remark = getPara("remark");
        String  money = getPara("money");


        new Invoices()
                .set("id", id)
                .set("billingDate", billingDate)
                .set("invoiceNum", invoiceNum)
                .set("chargeDate", chargeDate)
                .set("isCharge", isCharge)
                .set("type", type)
                .set("remark", remark)
                .set("money", money)
                .update();

        redirect("/invoice");
    }
}
