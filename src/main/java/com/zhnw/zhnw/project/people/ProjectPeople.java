package com.zhnw.zhnw.project.people;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.zhnw.purview.user.User;

/**
 * Created by guoyibin on 15/5/4.
 *
 * 项目人员
 */
public class ProjectPeople extends Model<ProjectPeople> {
    public static final ProjectPeople me = new ProjectPeople();

    /**
     * 分页搜索查询
     * */
    public Page<ProjectPeople> paginate(String currentPage, String pageSize, String projectId, User user) {
        String sql = " from pp where zhId="+user.get("zhId")+" and projectId="+Long.parseLong(projectId)+" ";
        sql+=" order by id desc ";
        return paginate(Integer.parseInt(currentPage), Integer.parseInt(pageSize), " select * ", sql);
    }
}
