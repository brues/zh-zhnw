package com.zhnw.zhnw.organization.zhMan;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.zhnw.purview.actor.Actor;
import com.zhnw.zhnw.purview.actorPurview.ActorPurview;
import com.zhnw.zhnw.purview.purview.Purview;
import com.zhnw.zhnw.purview.user.User;
import com.zhnw.zhnw.purview.userActor.UserActor;
import org.omg.PortableServer.LIFESPAN_POLICY_ID;

import java.util.Date;
import java.util.List;

/**
 * Created by guoyibin on 15/7/3.
 *
 * 机构人员管理
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
     * 设置管理员
     * */
    public void admin(){
        String  id = getPara("id");

        String  name = getPara("name");
        String  contactMan = getPara("contactMan");
        String  tel = getPara("tel");
        String  phone = getPara("phone");
        String  email = getPara("email");

        String  zhId = getPara("zhId");

        System.out.println(zhId);

        /*机构人员备注改为：管理员*/
        new ZhMan()
                .set("id", id)
                .set("remark","管理员")
                .update();



        /* 添加用户 */
        List<User> userList = User.me.find("select * from user where userName='"+phone+"'");
        if (userList.size()==0) {
            new User()
                    .set("userName", phone)
                    .set("password", "123456")
                    .set("phone", phone)
                    .set("email", email)
                    .set("trueName", name)
                    .set("remark", "")
                    .set("status", "在职")
                    .set("registDate", new Date())
                    .set("zhId", zhId)
                    .set("zhManId", id)
                    .save();
        }

        /* 添加角色 */
        List<Actor> actorList = Actor.me.find("select * from actor where zhId="+zhId+" and actorName='管理员'");
        if (actorList.size()==0){
            new Actor().set("zhId",zhId).set("actorName","管理员").save();
        }

        /* 添加用户角色 */
        List<User> users = User.me.find("select * from user where userName='"+phone+"'");
        List<Actor> actors = Actor.me.find("select * from actor where zhId="+zhId+" and actorName='管理员'");
        User user = users.get(0);
        Actor actor = actors.get(0);
        List<UserActor> userActorList = UserActor.me.find("select * from userActor where userId=" + user.get("id") + " and actorId=" + actor.get("id"));
        if (userActorList.size()==0){
            new UserActor().set("userId",user.get("id")).set("actorId",actor.get("id")).save();
        }

        /* 修改用户 */
        user.set("actorName",actor.get("actorName")).update();

        /* 添加角色权限 */
        List<ActorPurview> actorPurviewList = ActorPurview.me.find("select * from actorPurview a where a.actorId in (select b.id from actor b where b.zhId="+zhId+" and b.actorName='管理员')");
        if (actorPurviewList.size()==0){
            List<Purview> purviewList = Purview.me.find("select * from purview where parentId!=0 and url!='/purview' and purviewName!='机构管理' and purviewName!='机构信息'");
            for (Purview purview : purviewList){
                new ActorPurview().set("actorId",actor.get("id")).set("purviewId",purview.get("id")).save();
            }
        }


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
