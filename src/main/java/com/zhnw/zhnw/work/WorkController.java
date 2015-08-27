package com.zhnw.zhnw.work;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.zhnw.purview.user.User;

import java.util.List;

/**
 * Created by guoyibin on 15/6/25.
 *
 * 例会管理：工作记录
 */
public class WorkController extends Controller {

    /**
     * 工作评估管理主页
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

        Page<Work> workPage = Work.me.paginate(currentPage, pageSize,nameId, thing, forecast, isend, user);
        


        setAttr("workList",workPage.getList());
        setAttr("totalCount",workPage.getTotalRow());
        setAttr("totalPage",workPage.getTotalPage());
        setAttr("pageSize",workPage.getPageSize());
        setAttr("currentPage",workPage.getPageNumber());

        setAttr("nameId",nameId);
        setAttr("thing",thing);
        setAttr("forecast",forecast);
        setAttr("isend",isend);

        renderJsp("/WEB-INF/content/work/work.jsp");
    }

    /**
     * ajax获取列表
     * */
    public void nameJson(){
        User user = getSessionAttr("zhnw_loginUser");
        List<Work> works = Work.me.find("select distinct name,nameId from work where zhId="+user.get("zhId"));
        renderJson(works);
    }

    /**
     * ajax获取列表
     * */
    public void thingJson(){
        User user = getSessionAttr("zhnw_loginUser");
        List<Work> works = Work.me.find("select distinct thing from work where zhId="+user.get("zhId"));
        renderJson(works);
    }

    /**
     *
     * ajax获取列表
     * */
    public void forecastJson(){
        User user = getSessionAttr("zhnw_loginUser");
        List<Work> works = Work.me.find("select distinct forecast from work where zhId="+user.get("zhId"));
        renderJson(works);
    }





    /**
     * 删除工作记录
     * */
    public void delete(){
        String id = getPara("id");
        Work.me.deleteById(id);


        User user = getSessionAttr("zhnw_loginUser");
        String  nameId = getPara("nameId");
        String  thing = getPara("thing");
        String  forecast = getPara("forecast");
        String  isend = getPara("isend");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<Work> workPage = Work.me.paginate(currentPage, pageSize,nameId, thing, forecast, isend, user);



        setAttr("workList",workPage.getList());
        setAttr("totalCount",workPage.getTotalRow());
        setAttr("totalPage",workPage.getTotalPage());
        setAttr("pageSize",workPage.getPageSize());
        setAttr("currentPage",workPage.getPageNumber());

        setAttr("nameId",nameId);
        setAttr("thing",thing);
        setAttr("forecast",forecast);
        setAttr("isend",isend);

        renderJsp("/WEB-INF/content/work/work.jsp");
    }

    /**
     * 添加工作记录
     * */
    public void add(){
        User user = getSessionAttr("zhnw_loginUser");
        String  name = user.get("trueName");
        Long  nameId = user.get("id");

        String  thing = getPara("thing");

        String  accountableId = getPara("accountableId");
        String  accountable = "";
        if (Long.parseLong(accountableId)!=0){
             accountable = User.me.findById(Long.parseLong(accountableId)).get("trueName");
        }

        String  begin = getPara("begin");
        String  forecast = getPara("forecast");
        String  end = getPara("end");
        String  isend = getPara("isend");

        String  progress = getPara("progress");

        String  reviewId = getPara("reviewId");
        String  review = "";
        if (Long.parseLong(reviewId)!=0){
            review = User.me.findById(Long.parseLong(reviewId)).get("trueName");
        }

        Work work = new Work();
        work
            .set("name", name)
            .set("nameId", nameId)
            .set("thing", thing)
            .set("accountableId", Long.parseLong(accountableId))
            .set("accountable", accountable);

        if (begin!=null&&begin.trim().length()!=0){work.set("begin", begin);}
        if (forecast!=null&&forecast.trim().length()!=0){work.set("forecast", forecast);}
        if (end!=null&&end.trim().length()!=0){work.set("end", end);}

        work.set("isend", isend)
            .set("progress", progress)
            .set("reviewId", Long.parseLong(reviewId))
            .set("review", review)
            .set("zhId", user.get("zhId"))
            .save();






        String  addnameId = getPara("addnameId");
        String  addthing = getPara("addthing");
        String  addforecast = getPara("addforecast");
        String  addisend = getPara("addisend");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<Work> workPage = Work.me.paginate(currentPage, pageSize,addnameId, addthing, addforecast, addisend, user);



        setAttr("workList",workPage.getList());
        setAttr("totalCount",workPage.getTotalRow());
        setAttr("totalPage",workPage.getTotalPage());
        setAttr("pageSize",workPage.getPageSize());
        setAttr("currentPage",workPage.getPageNumber());

        setAttr("nameId",addnameId);
        setAttr("thing",addthing);
        setAttr("forecast",addforecast);
        setAttr("isend",addisend);

        renderJsp("/WEB-INF/content/work/work.jsp");
    }

    /**
     * 更新业务类型资料
     * */
    public void update(){
        String  id = getPara("id");


        User user = getSessionAttr("zhnw_loginUser");
        String  name = user.get("trueName");
        Long  nameId = user.get("id");

        String  thing = getPara("thing");

        String  accountableId = getPara("accountableId");
        String  accountable = "";
        if (Long.parseLong(accountableId)!=0){
            accountable = User.me.findById(Long.parseLong(accountableId)).get("trueName");
        }

        String  begin = getPara("begin");
        String  forecast = getPara("forecast");
        String  end = getPara("end");
        String  isend = getPara("isend");

        String  progress = getPara("progress");

        String  reviewId = getPara("reviewId");
        String  review = "";
        if (Long.parseLong(reviewId)!=0){
            review = User.me.findById(Long.parseLong(reviewId)).get("trueName");
        }


        Work work = new Work();
        work
            .set("id", id)
            .set("name", name)
            .set("nameId", nameId)
            .set("thing", thing)
            .set("accountableId", Long.parseLong(accountableId))
            .set("accountable", accountable)
            .set("begin", begin)
            .set("forecast", forecast)
            .set("isend", isend)
            .set("progress", progress)
            .set("reviewId", Long.parseLong(reviewId))
            .set("review", review);
        if (end!=null&&end.trim().length()!=0){
            work.set("end", end);
        }
        work.update();






        String  addnameId = getPara("updatenameId");
        String  addthing = getPara("updatething");
        String  addforecast = getPara("updateforecast");
        String  addisend = getPara("updateisend");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<Work> workPage = Work.me.paginate(currentPage, pageSize,addnameId, addthing, addforecast, addisend, user);



        setAttr("workList",workPage.getList());
        setAttr("totalCount",workPage.getTotalRow());
        setAttr("totalPage",workPage.getTotalPage());
        setAttr("pageSize",workPage.getPageSize());
        setAttr("currentPage",workPage.getPageNumber());

        setAttr("nameId",addnameId);
        setAttr("thing",addthing);
        setAttr("forecast",addforecast);
        setAttr("isend",addisend);

        renderJsp("/WEB-INF/content/work/work.jsp");
    }



}
