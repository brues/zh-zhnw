package com.zhnw.common;

import com.jfinal.config.*;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;
import com.zhnw.interceptor.UserInterceptor;
import com.zhnw.zhnw.businesstype.BusinessType;
import com.zhnw.zhnw.businesstype.BusinessTypeController;
import com.zhnw.zhnw.clientcompany.ClientCompany;
import com.zhnw.zhnw.clientcompany.ClientCompanyController;
import com.zhnw.zhnw.clientcompany.ClientPeople;
import com.zhnw.zhnw.clientcompany.ClientPeopleController;
import com.zhnw.zhnw.hour.Hour;
import com.zhnw.zhnw.hour.HourController;
import com.zhnw.zhnw.index.index.IndexController;
import com.zhnw.zhnw.index.main.MainController;
import com.zhnw.zhnw.index.welcome.WelcomeController;
import com.zhnw.zhnw.invoices.Invoices;
import com.zhnw.zhnw.invoices.InvoicesController;
import com.zhnw.zhnw.organization.zh.Zh;
import com.zhnw.zhnw.organization.zh.ZhController;
import com.zhnw.zhnw.organization.zhMan.ZhMan;
import com.zhnw.zhnw.organization.zhMan.ZhManController;
import com.zhnw.zhnw.project.people.PeopleController;
import com.zhnw.zhnw.project.people.ProjectPeople;
import com.zhnw.zhnw.project.process.ProjectProcess;
import com.zhnw.zhnw.project.process.ProjectProcessController;
import com.zhnw.zhnw.project.project.Project;
import com.zhnw.zhnw.project.project.ProjectController;
import com.zhnw.zhnw.purview.actor.Actor;
import com.zhnw.zhnw.purview.actor.ActorController;
import com.zhnw.zhnw.purview.actorPurview.ActorPurview;
import com.zhnw.zhnw.purview.purview.Purview;
import com.zhnw.zhnw.purview.purview.PurviewController;
import com.zhnw.zhnw.purview.user.User;
import com.zhnw.zhnw.purview.user.UserController;
import com.zhnw.zhnw.purview.userActor.UserActor;
import com.zhnw.zhnw.work.Work;
import com.zhnw.zhnw.work.WorkController;


/**
 * Created by guoyibin on 15/1/9.
 *
 *
 */
public class ZhnwConfig extends JFinalConfig {
    /**
     * 配置常量
     */
    public void configConstant(Constants me) {
        // 加载少量必要配置，随后可用getProperty(...)获取值
        loadPropertyFile("zhnw_config.txt");
        me.setDevMode(getPropertyToBoolean("devMode", true));
        me.setViewType(ViewType.JSP);
        me.setEncoding("utf-8");
    }

    /**
     * 配置路由
     */
    public void configRoute(Routes me) {
        me.add("/", IndexController.class, "/index");	// 第三个参数为该Controller的视图存放路径,与第一个参数相同可以省略
        me.add("/main", MainController.class);
        me.add("/welcome", WelcomeController.class);
        me.add("/user", UserController.class);
        me.add("/purview", PurviewController.class);
        me.add("/actor", ActorController.class);
        me.add("/btype", BusinessTypeController.class);
        me.add("/client", ClientCompanyController.class);
        me.add("/clientp", ClientPeopleController.class);
        me.add("/project", ProjectController.class);
        me.add("/project/process", ProjectProcessController.class);
        me.add("/project/people", PeopleController.class);
        me.add("/project/hour", com.zhnw.zhnw.project.hour.HourController.class);
        me.add("/project/invoice", com.zhnw.zhnw.project.invoices.InvoicesController.class);
        me.add("/project/work", com.zhnw.zhnw.project.work.WorkController.class);
        me.add("/hour", HourController.class);
        me.add("/invoice", InvoicesController.class);
        me.add("/work", WorkController.class);
        me.add("/zh", ZhController.class);
        me.add("/zhMan", ZhManController.class);
    }

    /**
     * 配置插件
     */
    public void configPlugin(Plugins me) {
        // 配置C3p0数据库连接池插件
        C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbcUrl"), getProperty("user"), getProperty("password").trim());
        me.add(c3p0Plugin);

        // 配置ActiveRecord插件
        ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
        arp.setShowSql(true);
        arp.setDevMode(getPropertyToBoolean("devMode", true));
        me.add(arp);
        arp.addMapping("user", User.class);	// 映射user表到User模型
        arp.addMapping("actor", Actor.class);
        arp.addMapping("purview", Purview.class);
        arp.addMapping("userActor", UserActor.class);
        arp.addMapping("actorPurview", ActorPurview.class);
        arp.addMapping("businesstype", BusinessType.class);
        arp.addMapping("clientcompany", ClientCompany.class);
        arp.addMapping("hours", Hour.class);
        arp.addMapping("invoices", Invoices.class);
        arp.addMapping("project", Project.class);
        arp.addMapping("pp", ProjectPeople.class);
        arp.addMapping("process", ProjectProcess.class);
        arp.addMapping("work", Work.class);
        arp.addMapping("zh", Zh.class);
        arp.addMapping("zhMan", ZhMan.class);
        arp.addMapping("clientpeople", ClientPeople.class);
    }

    /**
     * 配置全局拦截器
     */
    public void configInterceptor(Interceptors me) {
        me.add(new UserInterceptor());
    }

    /**
     * 配置处理器
     */
    public void configHandler(Handlers me) {

    }
}
