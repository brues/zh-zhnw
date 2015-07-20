package com.zhnw.zhnw.purview.actor;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.zhnw.purview.actorPurview.ActorPurview;
import com.zhnw.zhnw.purview.purview.Purview;

import java.util.List;

/**
 * Created by guoyibin on 15/4/22.
 */
public class ActorController extends Controller {

    /**
     * 角色管理主页
     * */
    public void index(){

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");
        String  actorName = getPara("actorName");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";
        Page<Actor> actorPage = Actor.me.paginate(currentPage, pageSize, actorName);
        setAttr("actorList",actorPage.getList());
        setAttr("totalCount",actorPage.getTotalRow());
        setAttr("totalPage",actorPage.getTotalPage());
        setAttr("pageSize",actorPage.getPageSize());
        setAttr("currentPage",actorPage.getPageNumber());
        setAttr("actorName",actorName);

        List<Purview> purviewList = Purview.me.find("select * from purview where parentId=1");
        List<Purview> purviews  = Purview.me.find("select * from purview where isLeaf=1");
        setAttr("purviewList",purviewList);
        setAttr("purviews",purviews);

        renderJsp("/WEB-INF/content/purview/actor/actor.jsp");
    }

    /**
     * 删除角色
     * */
    public void delete(){
        String id = getPara("id");
        Actor.me.deleteById(id);

        String currentPage1 = getPara("currentPage1");
        String  pageSize1 = getPara("pageCount1");
        String  actorName1 = getPara("actorName1");

        if (currentPage1 == null) currentPage1 = "1";
        if (pageSize1 == null) pageSize1 = "10";
        Page<Actor> actorPage = Actor.me.paginate(currentPage1, pageSize1, actorName1);
        setAttr("actorList",actorPage.getList());
        setAttr("totalCount",actorPage.getTotalRow());
        setAttr("totalPage",actorPage.getTotalPage());
        setAttr("pageSize",actorPage.getPageSize());
        setAttr("currentPage",actorPage.getPageNumber());
        setAttr("actorName",actorName1);

        renderJsp("/WEB-INF/content/purview/actor/actor.jsp");


        //redirect("/actor");
    }

    /**
     * 添加角色
     * */
    public void add(){
        String  actorName = getPara("actorName");
        new Actor().set("actorName", actorName).save();


        String currentPage1 = getPara("currentPage1");
        String  pageSize1 = getPara("pageCount1");
        String  actorName1 = getPara("actorName1");

        if (currentPage1 == null) currentPage1 = "1";
        if (pageSize1 == null) pageSize1 = "10";
        Page<Actor> actorPage = Actor.me.paginate(currentPage1, pageSize1, actorName1);
        setAttr("actorList",actorPage.getList());
        setAttr("totalCount",actorPage.getTotalRow());
        setAttr("totalPage",actorPage.getTotalPage());
        setAttr("pageSize",actorPage.getPageSize());
        setAttr("currentPage",actorPage.getPageNumber());
        setAttr("actorName",actorName1);

        renderJsp("/WEB-INF/content/purview/actor/actor.jsp");
        //redirect("/actor");
    }

    /**
     * 更新角色资料
     * */
    public void update(){
        String  id = getPara("id");
        String  actorName = getPara("actorName");
        new Actor().set("id", id)
                .set("actorName", actorName)
                .update();


        String currentPage1 = getPara("currentPage1");
        String  pageSize1 = getPara("pageCount1");
        String  actorName1 = getPara("actorName1");

        if (currentPage1 == null) currentPage1 = "1";
        if (pageSize1 == null) pageSize1 = "10";
        Page<Actor> actorPage = Actor.me.paginate(currentPage1, pageSize1, actorName1);
        setAttr("actorList",actorPage.getList());
        setAttr("totalCount",actorPage.getTotalRow());
        setAttr("totalPage",actorPage.getTotalPage());
        setAttr("pageSize",actorPage.getPageSize());
        setAttr("currentPage",actorPage.getPageNumber());
        setAttr("actorName",actorName1);

        renderJsp("/WEB-INF/content/purview/actor/actor.jsp");
    }

    public void quchongfu(){
        String name = getPara("name");
        boolean temp = Actor.me.quchongfu(name);
        renderJson(temp);
    }

    public void quchongfuupdate(){
        String name = getPara("name");
        String id = getPara("id");
        boolean temp = Actor.me.quchongfuupdate(id,name);
        renderJson(temp);
    }

    /**
     * 角色权限
     * */
    public void actorPurview(){
        String actorId=getPara("actorId");
        String[] ids=getParaValues("ids");
        if (ids.length>0) {
            for (String id : ids) {
                new ActorPurview().set("actorId", actorId).set("purviewId", id).save();
            }
        }
        redirect("/actor");
    }
}
