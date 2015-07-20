package com.zhnw.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.zhnw.zhnw.purview.user.User;

import javax.servlet.http.HttpSession;

/**
 * Created by guoyibin on 15/1/15.
 *
 * 登陆权限验证
 */
public class UserInterceptor implements Interceptor {

    public void intercept(ActionInvocation ai) {
        HttpSession session = ai.getController().getSession();

        User user =(User) session.getAttribute("zhnw_loginUser");
        if(user==null){
            ai.getController().renderJsp("/WEB-INF/content/index/index/index.jsp");
        }else{
            ai.invoke();
        }
    }
}
