package com.zhnw.zhnw.invoices;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.zhnw.project.project.Project;
import com.zhnw.zhnw.purview.user.User;

import java.text.ParseException;
import java.util.List;

/**
 * Created by guoyibin on 15/5/4.
 *
 *  发票管理
 */
public class InvoicesController extends Controller {
    /**
     * 项目合同列表
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

        renderJsp("/WEB-INF/content/invoices/project.jsp");
    }

    /**
     * 发票管理主页
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
        User user = getSessionAttr("zhnw_loginUser");

        String  projectId = getPara("projectId");

        String  billingDate = getPara("billingDate");
        String  invoiceNum = getPara("invoiceNum");
        String  chargeDate = getPara("chargeDate");
        String  isCharge = getPara("isCharge");
        String  type = getPara("type");
        String  remark = getPara("remark");
        String  money = getPara("money");

        Invoices invoices = new Invoices();

        if (billingDate!=null&&billingDate.trim().length()!=0){
            invoices.set("billingDate", billingDate);
        }
        if (chargeDate!=null&&chargeDate.trim().length()!=0){
            invoices.set("chargeDate", chargeDate);
        }
        invoices
            .set("invoiceNum", invoiceNum)
            .set("isCharge", isCharge)
            .set("type", type)
            .set("remark", remark)
            .set("money", money)
            .set("projectId", projectId)
            .set("zhId", user.get("zhId"))
            .save();



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
     * 删除
     * */
    public void delete(){
        String id = getPara("id");
        Invoices.me.deleteById(id);


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

        Invoices invoices = new Invoices();


        if (billingDate!=null&&billingDate.trim().length()!=0){
            invoices.set("billingDate", billingDate);
        }
        if (chargeDate!=null&& chargeDate.trim().length()!=0){
            invoices.set("chargeDate", chargeDate);
        }

        invoices
            .set("id", id)
            .set("invoiceNum", invoiceNum)
            .set("isCharge", isCharge)
            .set("type", type)
            .set("remark", remark)
            .set("money", money)
            .update();




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
     * ajax:增加发票，验证发票编号是否存在
     * */
    public void saveInvoiceNumSingle(){
        String invoiceNum = getPara("invoiceNum");
        List<Invoices> invoicesList = Invoices.me.find("select * from invoices where invoiceNum='"+invoiceNum+"'");
        if (invoicesList.size()==0){
            renderJson("0");
        }else{
            renderJson("1");
        }
    }

    /**
     * ajax:更新发票，验证发票编号是否存在
     * */
    public void updateInvoiceNumSingle(){
        String invoiceNum = getPara("invoiceNum");
        String id = getPara("id");
        List<Invoices> invoicesList = Invoices.me.find("select * from invoices where invoiceNum='"+invoiceNum+"' and id!="+id);
        if (invoicesList.size()==0){
            renderJson("0");
        }else{
            renderJson("1");
        }
    }
}
