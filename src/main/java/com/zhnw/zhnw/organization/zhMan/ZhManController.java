package com.zhnw.zhnw.organization.zhMan;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

/**
 * Created by guoyibin on 15/7/3.
 */
public class ZhManController extends Controller {
    /**
     * 查询
     * */
    public void index(){

        String  zhId = getPara("zhId");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<ZhMan> zhManPage = ZhMan.me.paginate(currentPage, pageSize, zhId);



        setAttr("zhManList",zhManPage.getList());

        setAttr("totalCount",zhManPage.getTotalRow());
        setAttr("totalPage",zhManPage.getTotalPage());
        setAttr("pageSize",zhManPage.getPageSize());
        setAttr("currentPage",zhManPage.getPageNumber());

        setAttr("zhId",zhId);

        renderJsp("/WEB-INF/content/organization/zhMan/list.jsp");
    }

    /**
     * 删除记录
     * */
    public void delete(){
        String id = getPara("id");
        ZhMan.me.deleteById(id);



        String  zhId = getPara("zhId");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<ZhMan> zhManPage = ZhMan.me.paginate(currentPage, pageSize, zhId);



        setAttr("zhManList",zhManPage.getList());

        setAttr("totalCount",zhManPage.getTotalRow());
        setAttr("totalPage",zhManPage.getTotalPage());
        setAttr("pageSize",zhManPage.getPageSize());
        setAttr("currentPage",zhManPage.getPageNumber());

        setAttr("zhId",zhId);

        renderJsp("/WEB-INF/content/organization/zhMan/list.jsp");
    }

    /**
     * 添加工作记录
     * */
    public void add(){

        String  zhId = getPara("zhId");
        String  name = getPara("name");
        String  contactMan = getPara("contactMan");
        String  tel = getPara("tel");
        String  phone = getPara("phone");
        String  email = getPara("email");

        new ZhMan()
                .set("zhId", zhId)
                .set("name", name)
                .set("contactMan", contactMan)
                .set("tel", tel)
                .set("phone", phone)
                .set("email", email)
                .save();






        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<ZhMan> zhManPage = ZhMan.me.paginate(currentPage, pageSize, zhId);



        setAttr("zhManList",zhManPage.getList());

        setAttr("totalCount",zhManPage.getTotalRow());
        setAttr("totalPage",zhManPage.getTotalPage());
        setAttr("pageSize",zhManPage.getPageSize());
        setAttr("currentPage",zhManPage.getPageNumber());

        setAttr("zhId",zhId);

        renderJsp("/WEB-INF/content/organization/zhMan/list.jsp");
    }

    /**
     * 更新业务类型资料
     * */
    public void update(){
        String  id = getPara("id");

        String  name = getPara("name");
        String  contactMan = getPara("contactMan");
        String  tel = getPara("tel");
        String  phone = getPara("phone");
        String  email = getPara("email");

        new ZhMan()
                .set("id", id)
                .set("name", name)
                .set("contactMan", contactMan)
                .set("tel", tel)
                .set("phone", phone)
                .set("email", email)
                .update();


        String  zhId = getPara("zhId");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<ZhMan> zhManPage = ZhMan.me.paginate(currentPage, pageSize, zhId);



        setAttr("zhManList",zhManPage.getList());

        setAttr("totalCount",zhManPage.getTotalRow());
        setAttr("totalPage",zhManPage.getTotalPage());
        setAttr("pageSize",zhManPage.getPageSize());
        setAttr("currentPage",zhManPage.getPageNumber());

        setAttr("zhId",zhId);

        renderJsp("/WEB-INF/content/organization/zhMan/list.jsp");
    }
}
