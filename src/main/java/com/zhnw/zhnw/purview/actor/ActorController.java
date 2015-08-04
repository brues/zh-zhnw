package com.zhnw.zhnw.purview.actor;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.zhnw.purview.actorPurview.ActorPurview;
import com.zhnw.zhnw.purview.purview.Purview;
import com.zhnw.zhnw.purview.user.User;
import com.zhnw.zhnw.purview.userActor.UserActor;

import java.util.List;

/**
 * Created by guoyibin on 15/4/22.
 *
 * 角色管理
 */
public class ActorController extends Controller {

    /**
     * 角色管理主页
     * */
    public void index(){
        User user = getSessionAttr("zhnw_loginUser");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<Actor> actorPage = Actor.me.paginate(currentPage, pageSize, user);

        setAttr("actorList",actorPage.getList());
        setAttr("totalCount",actorPage.getTotalRow());
        setAttr("totalPage",actorPage.getTotalPage());
        setAttr("pageSize",actorPage.getPageSize());
        setAttr("currentPage",actorPage.getPageNumber());

        List<Purview> purviewList = Purview.me.find("select * from purview where parentId=1 and purviewName!='机构管理'");
        List<Purview> purviews  = Purview.me.find("select * from purview where isLeaf=1 and url!='/purview' and purviewName!='机构信息'");
        setAttr("purviewList",purviewList);
        setAttr("purviews",purviews);

        renderJsp("/WEB-INF/content/purview/actor/actor.jsp");
    }

    /**
     * 添加角色
     * */
    public void add(){
        User user = getSessionAttr("zhnw_loginUser");

        String  actorName = getPara("actorName");
        new Actor()
                .set("actorName", actorName)
                .set("zhId", user.get("zhId"))
                .save();


        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<Actor> actorPage = Actor.me.paginate(currentPage, pageSize, user);

        setAttr("actorList",actorPage.getList());
        setAttr("totalCount",actorPage.getTotalRow());
        setAttr("totalPage",actorPage.getTotalPage());
        setAttr("pageSize",actorPage.getPageSize());
        setAttr("currentPage",actorPage.getPageNumber());

        List<Purview> purviewList = Purview.me.find("select * from purview where parentId=1 and purviewName!='机构管理'");
        List<Purview> purviews  = Purview.me.find("select * from purview where isLeaf=1 and url!='/purview' and purviewName!='机构信息'");
        setAttr("purviewList",purviewList);
        setAttr("purviews",purviews);

        renderJsp("/WEB-INF/content/purview/actor/actor.jsp");
    }

    /**
     * 更新角色资料
     * */
    public void update(){
        User user = getSessionAttr("zhnw_loginUser");

        String  id = getPara("id");
        String  actorName = getPara("actorName");
        new Actor().set("id", id)
                .set("actorName", actorName)
                .update();


        /* 更新改角色用户的角色名 */
        List<User> userList = User.me.find("select * from user where id in (select userId from userActor where actorId="+id+")");
        for (User user2 : userList) {
            new User().set("id",user2.get("id")).set("actorName", actorName).update();
        }


        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<Actor> actorPage = Actor.me.paginate(currentPage, pageSize, user);

        setAttr("actorList",actorPage.getList());
        setAttr("totalCount",actorPage.getTotalRow());
        setAttr("totalPage",actorPage.getTotalPage());
        setAttr("pageSize",actorPage.getPageSize());
        setAttr("currentPage",actorPage.getPageNumber());

        List<Purview> purviewList = Purview.me.find("select * from purview where parentId=1 and purviewName!='机构管理'");
        List<Purview> purviews  = Purview.me.find("select * from purview where isLeaf=1 and url!='/purview' and purviewName!='机构信息'");
        setAttr("purviewList",purviewList);
        setAttr("purviews",purviews);

        renderJsp("/WEB-INF/content/purview/actor/actor.jsp");
    }

    /**
     * 删除角色
     * */
    public void delete(){
        User user = getSessionAttr("zhnw_loginUser");
        String id = getPara("id");
        Actor.me.deleteById(id);

        /* 删除角色权限 */
        List<ActorPurview> actorPurviewList = ActorPurview.me.find("select * from actorPurview where actorId=" + id);
        for (ActorPurview actorPurview : actorPurviewList) {
            ActorPurview.me.deleteById(actorPurview.get("id"));
        }

        /* 删除用户角色 */
        List<UserActor> userActorList = UserActor.me.find("select * from userActor where actorId=" + id);
        for (UserActor userActor : userActorList) {
            UserActor.me.deleteById(userActor.get("id"));
        }

        /* 更新改角色用户的角色名 */
        List<User> userList = User.me.find("select * from user where id in (select userId from userActor where actorId="+id+")");
        for (User user2 : userList) {
            new User().set("id",user2.get("id")).set("actorName", "").update();
        }


        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<Actor> actorPage = Actor.me.paginate(currentPage, pageSize, user);

        setAttr("actorList",actorPage.getList());
        setAttr("totalCount",actorPage.getTotalRow());
        setAttr("totalPage",actorPage.getTotalPage());
        setAttr("pageSize",actorPage.getPageSize());
        setAttr("currentPage",actorPage.getPageNumber());

        List<Purview> purviewList = Purview.me.find("select * from purview where parentId=1 and purviewName!='机构管理'");
        List<Purview> purviews  = Purview.me.find("select * from purview where isLeaf=1 and url!='/purview' and purviewName!='机构信息'");
        setAttr("purviewList",purviewList);
        setAttr("purviews",purviews);

        renderJsp("/WEB-INF/content/purview/actor/actor.jsp");
    }






    /**
     * 验证角色名是否重复：添加角色
     * */
    public void addActorNameSingle(){
        User user = getSessionAttr("zhnw_loginUser");
        String actorName = getPara("actorName");
        List<Actor> actors = Actor.me.find("select * from actor where zhId=" + user.get("zhId") + " and actorName='" + actorName + "'");
        if(actors.size()==0)
            renderJson("0");
        else
            renderJson("1");
    }

    /**
     * 验证角色名是否重复：更新角色
     * */
    public void updateActorNameSingle(){
        User user = getSessionAttr("zhnw_loginUser");
        String id = getPara("id");
        String actorName = getPara("actorName");
        List<Actor> actors = Actor.me.find("select * from actor where zhId=" + user.get("zhId") + " and actorName='" + actorName + "' and id!="+id);
        if(actors.size()==0)
            renderJson("0");
        else
            renderJson("1");
    }

    /**
     * 角色权限
     * */
    public void actorPurview(){
        User user = getSessionAttr("zhnw_loginUser");

        String actorId=getPara("actorId");

        /* 删除角色权限 */
        List<ActorPurview> actorPurviewList = ActorPurview.me.find("select * from actorPurview where actorId=" + actorId);
        for (ActorPurview actorPurview : actorPurviewList) {
            ActorPurview.me.deleteById(actorPurview.get("id"));
        }

        String[] ids=getParaValues("ids");
        if (ids.length>0) {
            for (String id : ids) {
                new ActorPurview().set("actorId", actorId).set("purviewId", id).save();
            }
        }




        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<Actor> actorPage = Actor.me.paginate(currentPage, pageSize, user);

        setAttr("actorList",actorPage.getList());
        setAttr("totalCount",actorPage.getTotalRow());
        setAttr("totalPage",actorPage.getTotalPage());
        setAttr("pageSize",actorPage.getPageSize());
        setAttr("currentPage",actorPage.getPageNumber());

        List<Purview> purviewList = Purview.me.find("select * from purview where parentId=1 and purviewName!='机构管理'");
        List<Purview> purviews  = Purview.me.find("select * from purview where isLeaf=1 and url!='/purview' and purviewName!='机构信息'");
        setAttr("purviewList",purviewList);
        setAttr("purviews",purviews);

        renderJsp("/WEB-INF/content/purview/actor/actor.jsp");
    }
}
