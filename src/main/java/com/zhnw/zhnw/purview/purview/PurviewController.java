package com.zhnw.zhnw.purview.purview;

import com.jfinal.core.Controller;
import com.zhnw.zhnw.purview.actorPurview.ActorPurview;

import java.util.List;

/**
 * Created by guoyibin on 15/4/22.
 *
 * 权限管理
 */
public class PurviewController extends Controller {

    /**
     * 权限管理主页
     * */
    public void index(){
        List<Purview> purviewList = Purview.me.find("select * from purview where parentId=1");
        List<Purview> purviews  = Purview.me.find("select * from purview where isLeaf=1");
        setAttr("purviewList",purviewList);
        setAttr("purviews",purviews);
        renderJsp("/WEB-INF/content/purview/purview/purview.jsp");
    }

    /**
     * 添加一级权限
     * */
    public void addOne(){
        String purviewName = getPara("purviewName");
        new Purview().
                set("isLeaf","0").
                set("parentId",1l).
                set("purviewName",purviewName).
                set("url","#").
                save();
        redirect("/purview");
    }

    /**
     * 添加二级权限
     * */
    public void addTwo(){
        String parentId = getPara("parentId");
        String purviewName = getPara("purviewName");
        String url = getPara("url");
        new Purview().
                set("isLeaf","1").
                set("parentId", parentId).
                set("purviewName",purviewName).
                set("url",url).
                save();
        redirect("/purview");
    }

    /**
     * 删除权限
     * */
    public void delete(){
        String id = getPara("id");
        Purview.me.deleteById(id);

        List<ActorPurview> actorPurviewList = ActorPurview.me.find("select * from actorPurview where purviewId="+id);
        for (ActorPurview actorPurview : actorPurviewList){
            ActorPurview.me.deleteById(actorPurview.get("id"));
        }

        List<Purview> purviews  = Purview.me.find("select * from purview where parentId="+id);
        for (Purview purview : purviews){
            Purview.me.deleteById(purview.get("id"));
            List<ActorPurview> actorPurviews = ActorPurview.me.find("select * from actorPurview where purviewId="+purview.get("id"));
            for (ActorPurview actorPurview : actorPurviews){
                ActorPurview.me.deleteById(actorPurview.get("id"));
            }

        }
        redirect("/purview");
    }


    /**
     * 更新一级目录
     * */
    public void updateOne(){
        String id = getPara("id");
        String purviewName = getPara("purviewName");
        new Purview().
                set("id", id).
                set("purviewName",purviewName).
                update();
        redirect("/purview");
    }

    /**
     * 更新二级目录
     * */
    public void updateTwo(){
        String id = getPara("id");
        String purviewName = getPara("purviewName");
        String url = getPara("url");
        new Purview().
                set("id",id).
                set("purviewName",purviewName).
                set("url",url).
                update();
        redirect("/purview");
    }

    /**
     *
     * ajax获取列表-添加一级权限-验证目录名是否已存在
     * */
    public void addOnePurviewNameSingleJson(){
        String  purviewName = getPara("purviewName");
        List<Purview> purviewList = Purview.me.find("select * from purview where parentId=1 and purviewName='"+purviewName+"'");
        if (purviewList.size()==0)
            renderJson("0");
        else
            renderJson("1");
    }

    /**
     *
     * ajax获取列表-添加二级权限-验证目录名是否已存在
     * */
    public void addTwoPurviewNameSingleJson(){
        String  parentId = getPara("parentId");
        String  purviewName = getPara("purviewName");
        List<Purview> purviewList = Purview.me.find("select * from purview where parentId="+parentId+" and purviewName='"+purviewName+"'");
        if (purviewList.size()==0)
            renderJson("0");
        else
            renderJson("1");
    }

    /**
     *
     * ajax获取列表-添加二级权限-验证链接地址是否已存在
     * */
    public void addTwoUrlSingleJson(){
        String  parentId = getPara("parentId");
        String  url = getPara("url");
        List<Purview> purviewList = Purview.me.find("select * from purview where parentId="+parentId+" and url='"+url+"'");
        if (purviewList.size()==0)
            renderJson("0");
        else
            renderJson("1");
    }

    /**
     *
     * ajax获取列表-更新一级权限-验证目录名是否已存在
     * */
    public void updateOnePurviewNameSingleJson(){
        String  id = getPara("id");
        String  purviewName = getPara("purviewName");
        List<Purview> purviewList = Purview.me.find("select * from purview where parentId=1 and purviewName='"+purviewName+"' and id!="+id);
        if (purviewList.size()==0)
            renderJson("0");
        else
            renderJson("1");
    }

    /**
     *
     * ajax获取列表-更新二级权限-验证目录名是否已存在
     * */
    public void updateTwoPurviewNameSingleJson(){
        String  id = getPara("id");
        Purview purview = Purview.me.findById(Long.parseLong(id));
        String  purviewName = getPara("purviewName");
        List<Purview> purviewList = Purview.me.find("select * from purview where parentId="+purview.get("parentId")+" and purviewName='"+purviewName+"' and id!="+id);
        if (purviewList.size()==0)
            renderJson("0");
        else
            renderJson("1");
    }

    /**
     *
     * ajax获取列表-更新二级权限-验证链接地址是否已存在
     * */
    public void updateTwoUrlSingleJson(){
        String  id = getPara("id");
        Purview purview = Purview.me.findById(Long.parseLong(id));
        String  url = getPara("url");
        List<Purview> purviewList = Purview.me.find("select * from purview where parentId="+purview.get("parentId")+" and url='"+url+"' and id!="+id);
        if (purviewList.size()==0)
            renderJson("0");
        else
            renderJson("1");
    }
}
