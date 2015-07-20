package com.zhnw.zhnw.index.index;

import com.jfinal.aop.ClearInterceptor;
import com.jfinal.core.Controller;
import com.zhnw.zhnw.purview.user.User;

import java.util.List;

/**
 * IndexController
 *
 * 首页
 */
@ClearInterceptor
public class IndexController extends Controller {

    /**
     * 跳转到首页
     *
     * */
    public void index() {
        removeSessionAttr("zhnw_loginUser");
        renderJsp("/WEB-INF/content/index/index/index.jsp");
    }

    /**
     * 跳转到首页
     *
     * */
    public void quit() {
        removeSessionAttr("zhnw_loginUser");
        redirect("/");
    }

    /**
     * 在首页：验证用户名是否存在
     *
     * */
    public void loginTest(){
        String name = getPara("userName");
        String pass = getPara("password");
        List<User> users = User.me.find("select * from user u where u.userName = '"+name.trim()+"' and u.password='"+pass.trim()+"' and status='在职'");
        if (users.size()==0){
            renderJson(false);
        }else {
            renderJson(true);
        }
    }
}



