package com.zhnw.zhnw.organization.zh;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

/**
 * Created by guoyibin on 15/7/3.
 */
public class ZhController extends Controller {

    /**
     * 机构管理主页
     * */
    public void index(){

        String  souContent = getPara("souContent");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<Zh> zhPage = Zh.me.paginate(currentPage, pageSize, souContent);



        setAttr("zhList",zhPage.getList());
        setAttr("totalCount",zhPage.getTotalRow());
        setAttr("totalPage",zhPage.getTotalPage());
        setAttr("pageSize",zhPage.getPageSize());
        setAttr("currentPage",zhPage.getPageNumber());

        setAttr("souContent",souContent);

        renderJsp("/WEB-INF/content/organization/zh/list.jsp");
    }


    /**
     * 删除
     * */
    public void delete(){
        String id = getPara("id");
        Zh.me.deleteById(id);



        String  souContent = getPara("souContent");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<Zh> zhPage = Zh.me.paginate(currentPage, pageSize, souContent);



        setAttr("zhList",zhPage.getList());
        setAttr("totalCount",zhPage.getTotalRow());
        setAttr("totalPage",zhPage.getTotalPage());
        setAttr("pageSize",zhPage.getPageSize());
        setAttr("currentPage",zhPage.getPageNumber());

        setAttr("souContent",souContent);

        renderJsp("/WEB-INF/content/organization/zh/list.jsp");
    }

    /**
     * 添加
     * */
    public void add(){
        String  comName = getPara("comName");
        String  shortName = getPara("shortName");
        String  address = getPara("address");

        new Zh()
                .set("comName", comName)
                .set("shortName", shortName)
                .set("address", address)
                .save();





        String  souContent = getPara("souContent");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<Zh> zhPage = Zh.me.paginate(currentPage, pageSize, souContent);



        setAttr("zhList",zhPage.getList());
        setAttr("totalCount",zhPage.getTotalRow());
        setAttr("totalPage",zhPage.getTotalPage());
        setAttr("pageSize",zhPage.getPageSize());
        setAttr("currentPage",zhPage.getPageNumber());

        setAttr("souContent",souContent);

        renderJsp("/WEB-INF/content/organization/zh/list.jsp");
    }

    /**
     * 更新
     * */
    public void update(){
        String  id = getPara("id");

        String  comName = getPara("comName");
        String  shortName = getPara("shortName");
        String  address = getPara("address");

        new Zh()
                .set("id", id)
                .set("comName", comName)
                .set("shortName", shortName)
                .set("address", address)
                .update();






        String  souContent = getPara("souContent");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<Zh> zhPage = Zh.me.paginate(currentPage, pageSize, souContent);



        setAttr("zhList",zhPage.getList());
        setAttr("totalCount",zhPage.getTotalRow());
        setAttr("totalPage",zhPage.getTotalPage());
        setAttr("pageSize",zhPage.getPageSize());
        setAttr("currentPage",zhPage.getPageNumber());

        setAttr("souContent",souContent);

        renderJsp("/WEB-INF/content/organization/zh/list.jsp");
    }

}
