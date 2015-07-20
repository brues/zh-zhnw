package com.zhnw.zhnw.index.main;

import com.jfinal.aop.ClearInterceptor;
import com.jfinal.core.Controller;
import com.zhnw.zhnw.purview.purview.Purview;
import com.zhnw.zhnw.purview.user.User;

import java.util.List;

/**
 * Created by guoyibin on 15/4/8.
 *
 *  主页面
 */
@ClearInterceptor
public class MainController extends Controller {

    /**
     * 跳转到主页面
     * */
    public void index() {
        String username = getPara("username");
        String password = getPara("password");


        if (getSessionAttr("zhnw_loginUser")!=null){
            User user = getSessionAttr("zhnw_loginUser");

            String sql1 = "select * from purview p where p.parentId=1 and " +
                    "p.id in (select a.purviewId from actorPurview a where " +
                    "a.actorId in (select u.actorId from userActor u where u.userId="+user.get("id")+") )";

            String sql2 = "select * from purview p where p.isLeaf=1 and " +
                    "p.id in (select a.purviewId from actorPurview a where " +
                    "a.actorId in (select u.actorId from userActor u where u.userId="+user.get("id")+") )";

            List<Purview> purviewList = Purview.me.find(sql1);
            List<Purview> purviews  = Purview.me.find(sql2);
            setAttr("purviewList",purviewList);
            setAttr("purviews",purviews);

            renderJsp("/WEB-INF/content/index/main/main.jsp");
        }else{
            if ((username==null||password==null||username.trim().equals("")||password.trim().equals(""))){
                redirect("/");
            }else{
                List<User> userList = User.me.find("select * from user where userName='"+username.trim()+"' and password='"+password.trim()+"'");
                if (userList.size()<=0){
                    redirect("/");
                }else if(userList.size()>1){
                    redirect("/");
                }else{

                    User user = userList.get(0);
                    setSessionAttr("zhnw_loginUser", user);

                    String sql1 = "select * from purview p where p.parentId=1 and " +
                            "p.id in (select a.purviewId from actorPurview a where " +
                            "a.actorId in (select u.actorId from userActor u where u.userId="+user.get("id")+") )";

                    String sql2 = "select * from purview p where p.isLeaf=1 and " +
                            "p.id in (select a.purviewId from actorPurview a where " +
                            "a.actorId in (select u.actorId from userActor u where u.userId="+user.get("id")+") )";

                    List<Purview> purviewList = Purview.me.find(sql1);
                    List<Purview> purviews  = Purview.me.find(sql2);
                    setAttr("purviewList",purviewList);
                    setAttr("purviews",purviews);

                    renderJsp("/WEB-INF/content/index/main/main.jsp");
                }
            }
        }
    }
}
