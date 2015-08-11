package com.zhnw.zhnw.project.work;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.zhnw.purview.user.User;
import com.zhnw.zhnw.work.Work;

import java.util.Locale;

/**
 * Created by guoyibin on 15/6/26.
 *
 * 项目管理：工作评价
 */
public class WorkController extends Controller {

    /**
     * 工作评估-工程-主页
     * */
    public void index(){
        User user = getSessionAttr("zhnw_loginUser");

        String  nameId = getPara("nameId");
        String  thing = getPara("thing");
        String  forecast = getPara("forecast");
        String  isend = getPara("isend");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<Work> workPage = Work.me.projectWorkPaginate(currentPage, pageSize, nameId, thing, forecast, isend, user);

        setAttr("workList",workPage.getList());
        setAttr("totalCount",workPage.getTotalRow());
        setAttr("totalPage",workPage.getTotalPage());
        setAttr("pageSize",workPage.getPageSize());
        setAttr("currentPage",workPage.getPageNumber());

        setAttr("nameId",nameId);
        setAttr("thing",thing);
        setAttr("forecast",forecast);
        setAttr("isend",isend);

        renderJsp("/WEB-INF/content/project/work/work.jsp");
    }


    /**
     * 评价工作记录
     * */
    public void update(){
        User user = getSessionAttr("zhnw_loginUser");

        String  id = getPara("id");
        String  assess = getPara("assess");
        String  reviewId = getPara("reviewId");

        if (Long.parseLong(reviewId)==Long.parseLong(user.get("id").toString())){//只有审核人才能评价
            new Work()
                    .set("id", id)
                    .set("assess", assess)
                    .update();
        }

        String  addnameId = getPara("updatenameId");
        String  addthing = getPara("updatething");
        String  addforecast = getPara("updateforecast");
        String  addisend = getPara("updateisend");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<Work> workPage = Work.me.projectWorkPaginate(currentPage, pageSize, addnameId, addthing, addforecast, addisend, user);


        setAttr("workList",workPage.getList());
        setAttr("totalCount",workPage.getTotalRow());
        setAttr("totalPage",workPage.getTotalPage());
        setAttr("pageSize",workPage.getPageSize());
        setAttr("currentPage",workPage.getPageNumber());

        setAttr("nameId",addnameId);
        setAttr("thing",addthing);
        setAttr("forecast",addforecast);
        setAttr("isend",addisend);

        renderJsp("/WEB-INF/content/project/work/work.jsp");
    }

}
