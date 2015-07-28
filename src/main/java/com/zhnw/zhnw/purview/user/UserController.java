package com.zhnw.zhnw.purview.user;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.zhnw.hour.Hour;
import com.zhnw.zhnw.organization.zhMan.ZhMan;
import com.zhnw.zhnw.project.people.ProjectPeople;
import com.zhnw.zhnw.project.process.ProjectProcess;
import com.zhnw.zhnw.project.project.Project;
import com.zhnw.zhnw.purview.actor.Actor;
import com.zhnw.zhnw.purview.userActor.UserActor;
import com.zhnw.zhnw.work.Work;

import java.util.Date;
import java.util.List;

/**
 * Created by guoyibin on 15/4/9.
 *
 * 用户管理 控制类
 */
public class UserController extends Controller {


    /**
     * 用户管理主页
     * */
    public void index(){
        User user = getSessionAttr("zhnw_loginUser");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        String  userName = getPara("userName");
        String  trueName = getPara("trueName");
        String  actorName = getPara("actorName");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<User> userPage = User.me.paginate(currentPage, pageSize, userName, trueName, actorName, user);

        setAttr("userList",userPage.getList());
        setAttr("totalCount",userPage.getTotalRow());
        setAttr("totalPage",userPage.getTotalPage());
        setAttr("pageSize",userPage.getPageSize());
        setAttr("currentPage",userPage.getPageNumber());

        setAttr("userName",userName);
        setAttr("trueName",trueName);
        setAttr("actorName",actorName);

        List<User> users = User.me.find("select * from user where zhId="+user.get("zhId")+" and status='在职'");
        List<Actor> actors = Actor.me.find("select * from actor where zhId="+user.get("zhId"));
        setAttr("users",users);
        setAttr("actors",actors);

        renderJsp("/WEB-INF/content/purview/user/list.jsp");
    }

    /**
     * 删除用户
     * */
    public void delete(){
        String id = getPara("id");
        new User().set("id",id).set("status","离职").update();

        User user = getSessionAttr("zhnw_loginUser");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageCount");
        String  userName = getPara("userName");
        String  trueName = getPara("trueName");
        String  actorName = getPara("actorName");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";
        Page<User> userPage = User.me.paginate(currentPage, pageSize, userName, trueName, actorName, user);
        setAttr("userList",userPage.getList());
        setAttr("totalCount",userPage.getTotalRow());
        setAttr("totalPage",userPage.getTotalPage());
        setAttr("pageSize",userPage.getPageSize());
        setAttr("currentPage",userPage.getPageNumber());
        setAttr("userName",userName);
        setAttr("trueName",trueName);
        setAttr("actorName",actorName);

        List<User> users = User.me.find("select * from user where zhId="+user.get("zhId")+" and status='在职'");
        List<Actor> actors = Actor.me.find("select * from actor where zhId="+user.get("zhId"));
        setAttr("users",users);
        setAttr("actors",actors);

        renderJsp("/WEB-INF/content/purview/user/list.jsp");
    }

    /**
     * 添加用户
     * */
    public void add(){
        User user = getSessionAttr("zhnw_loginUser");

        String  userName = getPara("userName");
        String  password = getPara("password");
        String  trueName = getPara("trueName");
        String  email = getPara("email");
        String  phone = getPara("phone");
        String  remark = getPara("remark");
        new User()
                .set("userName", userName)
                .set("password", password)
                .set("phone", phone)
                .set("email", email)
                .set("trueName", trueName)
                .set("remark", remark)
                .set("status", "在职")
                .set("registDate", new Date())
                .set("zhId",user.get("zhId"))
                .save();



        String currentPage1 = getPara("currentPage1");
        String  pageSize1 = getPara("pageCount1");
        String  userName1 = getPara("userName1");
        String  trueName1 = getPara("trueName1");
        String  actorName1 = getPara("actorName1");

        if (currentPage1 == null) currentPage1 = "1";
        if (pageSize1 == null) pageSize1 = "10";
        Page<User> userPage = User.me.paginate(currentPage1, pageSize1, userName1, trueName1, actorName1,user);
        setAttr("userList",userPage.getList());
        setAttr("totalCount",userPage.getTotalRow());
        setAttr("totalPage",userPage.getTotalPage());
        setAttr("pageSize",userPage.getPageSize());
        setAttr("currentPage",userPage.getPageNumber());
        setAttr("userName",userName1);
        setAttr("trueName",trueName1);
        setAttr("actorName",actorName1);

        List<User> users = User.me.find("select * from user where zhId="+user.get("zhId")+" and status='在职'");
        List<Actor> actors = Actor.me.find("select * from actor where zhId="+user.get("zhId"));
        setAttr("users",users);
        setAttr("actors",actors);

        renderJsp("/WEB-INF/content/purview/user/list.jsp");
    }

    /**
     * 更新用户资料
     * */
    public void update(){
        User user = getSessionAttr("zhnw_loginUser");

        String  id = getPara("id");
        String  userName = getPara("userName");
        String  trueName = getPara("trueName");
        String  email = getPara("email");
        String  phone = getPara("phone");
        String  remark = getPara("remark");
        new User().set("id", id)
                .set("userName", userName)
                .set("phone", phone)
                .set("email", email)
                .set("trueName", trueName)
                .set("remark", remark)
                .update();


        /*********************************/
        User user1 = User.me.findById(id);

        List<ZhMan> zhManList = ZhMan.me.find("select * from zhMan where id=" + user1.get("zhManId"));
        for (ZhMan zhMan : zhManList){
            zhMan.set("name",trueName).set("phone",phone).set("email",email).update();
        }

        List<Work> workList1 = Work.me.find("select * from work where nameId=" + id);
        for (Work work : workList1){
            work.set("name", trueName).update();
        }

        List<Work> workList2 = Work.me.find("select * from work where accountableId=" + id);
        for (Work work : workList2){
            work.set("accountable",trueName).update();
        }

        List<Work> workList3 = Work.me.find("select * from work where reviewId=" + id);
        for (Work work : workList3){
            work.set("review",trueName).update();
        }

        List<Hour> hours = Hour.me.find("select * from hours where nameId=" + id);
        for (Hour hour : hours){
            hour.set("name",trueName).update();
        }

        List<Hour> hourList = Hour.me.find("select * from hours where checkId=" + id);
        for (Hour hour : hourList){
            hour.set("checkName",trueName).update();
        }

        List<Project> projectList = Project.me.find("select * from project where contactId=" + id);
        for (Project project : projectList){
            project.set("contacts",trueName).update();
        }

        List<ProjectPeople> projectPeopleList = ProjectPeople.me.find("select * from pp where peopleId=" + id);
        for (ProjectPeople projectPeople : projectPeopleList){
            projectPeople.set("name",trueName).update();
        }

        List<ProjectProcess> projectProcesses = ProjectProcess.me.find("select * from process where principalId=" + id);
        for (ProjectProcess projectProcess : projectProcesses){
            projectProcess.set("principal",trueName).update();
        }

        List<ProjectProcess> projectProcessList = ProjectProcess.me.find("select * from process where reviewerId=" + id);
        for (ProjectProcess projectProcess : projectProcessList){
            projectProcess.set("reviewer",trueName).update();
        }

        /*********************************/

        String currentPage1 = getPara("currentPage1");
        String  pageSize1 = getPara("pageCount1");
        String  userName1 = getPara("userName1");
        String  trueName1 = getPara("trueName1");
        String  actorName1 = getPara("actorName1");

        if (currentPage1 == null) currentPage1 = "1";
        if (pageSize1 == null) pageSize1 = "10";
        Page<User> userPage = User.me.paginate(currentPage1, pageSize1, userName1, trueName1, actorName1, user);
        setAttr("userList",userPage.getList());
        setAttr("totalCount",userPage.getTotalRow());
        setAttr("totalPage",userPage.getTotalPage());
        setAttr("pageSize",userPage.getPageSize());
        setAttr("currentPage",userPage.getPageNumber());
        setAttr("userName",userName1);
        setAttr("trueName",trueName1);
        setAttr("actorName",actorName1);

        List<User> users = User.me.find("select * from user where zhId="+user.get("zhId")+" and status='在职'");
        List<Actor> actors = Actor.me.find("select * from actor where zhId="+user.get("zhId"));
        setAttr("users",users);
        setAttr("actors",actors);

        renderJsp("/WEB-INF/content/purview/user/list.jsp");
    }

    /**
     * 添加用户：验证用户名是否重复(不同机构的用户名也不能重复)
     * */
    public void userNameSingleAdd(){
        String name = getPara("name");
        List<User> users = User.me.find("select * from user where userName='" + name + "' ");
        if (users.size()!=0){
            renderJson(true);
        }else {
            renderJson(false);
        }
    }

    /**
     * 更新用户：验证用户名是否重复(不同机构的用户名也不能重复)
     * */
    public void userNameSingleUpdate(){
        String name = getPara("name");
        String id = getPara("id");
        List<User> users = User.me.find("select * from user where id!=" + id + " and userName='" + name + "' ");
        if (users.size()!=0){
            renderJson(true);
        }else {
            renderJson(false);
        }
    }

    /**
     *
     * ajax获取列表
     * */
    public void userJson(){
        User user = getSessionAttr("zhnw_loginUser");
        List<User> userList = User.me.find("select * from user where zhId="+user.get("zhId")+" and status='在职' order by id desc");
        renderJson(userList);
    }

    /**
     *
     * 初始化用户密码为：123456
     * */
    public void initialize(){
        String  userId = getPara("userId");
        new User().set("id",Long.parseLong(userId)).set("password","123456").update();
        setSessionAttr("zhnw_loginUser", User.me.findById(userId));
        renderJson("0");
    }

    /**
     * 给用户分配角色
     * */
    public void userActor(){
        User user = getSessionAttr("zhnw_loginUser");

        String  userId = getPara("userId");
        String  actorId = getPara("actorId");
        Actor actor = Actor.me.findById(actorId);
        String actorName = actor.get("actorName");
        new User().set("id",Long.parseLong(userId)).set("actorName",actorName).update();

        List<UserActor> userActorList = UserActor.me.find("select * from userActor where userId="+userId);
        if (userActorList.size()==0){
            new UserActor().set("actorId",actorId).set("userId",userId).save();
        }else{
            for (UserActor userActor : userActorList){
                UserActor.me.deleteById(userActor.get("id"));
            }
            new UserActor().set("actorId",actorId).set("userId",userId).save();
        }




        String currentPage1 = getPara("currentPage1");
        String  pageSize1 = getPara("pageCount1");
        String  userName1 = getPara("userName1");
        String  trueName1 = getPara("trueName1");
        String  actorName1 = getPara("actorName1");

        if (currentPage1 == null) currentPage1 = "1";
        if (pageSize1 == null) pageSize1 = "10";
        Page<User> userPage = User.me.paginate(currentPage1, pageSize1, userName1, trueName1, actorName1, user);
        setAttr("userList",userPage.getList());
        setAttr("totalCount",userPage.getTotalRow());
        setAttr("totalPage",userPage.getTotalPage());
        setAttr("pageSize",userPage.getPageSize());
        setAttr("currentPage",userPage.getPageNumber());
        setAttr("userName",userName1);
        setAttr("trueName",trueName1);
        setAttr("actorName",actorName1);

        List<User> users = User.me.find("select * from user where zhId="+user.get("zhId")+" and status='在职'");
        List<Actor> actors = Actor.me.find("select * from actor where zhId="+user.get("zhId"));
        setAttr("users",users);
        setAttr("actors",actors);

        renderJsp("/WEB-INF/content/purview/user/list.jsp");
    }

    /**
     * 修改密码
     * */
    public void change(){
        renderJsp("/WEB-INF/content/purview/user/updatePassword.jsp");
    }

    /**
     * 修改密码：验证原始密码是否正确
     * */
    public void passwordOk(){
        User user = getSessionAttr("zhnw_loginUser");
        String password = user.get("password");
        String  password2 = getPara("password");
        if (password.equals(password2)){
            renderJson("1");
        }else{
            renderJson("0");
        }
    }

    /**
     * 修改密码成功
     * */
    public void changes(){
        User user = getSessionAttr("zhnw_loginUser");
        Long  id = user.get("id");
        String  password = getPara("password");
        new User().set("id", id).set("password", password).update();
        setSessionAttr("zhnw_loginUser",User.me.findById(id));
        redirect("/welcome");
    }
}
