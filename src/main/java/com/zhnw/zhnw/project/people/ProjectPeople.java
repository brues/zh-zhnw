package com.zhnw.zhnw.project.people;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * Created by guoyibin on 15/5/4.
 */
public class ProjectPeople extends Model<ProjectPeople> {
    public static final ProjectPeople me = new ProjectPeople();

    public Page<ProjectPeople> paginate(String currentPage, String pageSize, String name, String projectId) {
        String sql = " from pp where projectId="+Long.parseLong(projectId)+" ";
        if (name!=null&&!name.trim().equalsIgnoreCase("")&&!name.equals("0")){
            sql+=" and name="+name+"";
        }
        sql+=" order by id desc ";
        return paginate(Integer.parseInt(currentPage), Integer.parseInt(pageSize), " select * ", sql);
    }
}
