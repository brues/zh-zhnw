package com.zhnw.zhnw.project.process;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * Created by guoyibin on 15/5/6.
 *
 */
public class ProjectProcess extends Model<ProjectProcess> {
    public static final ProjectProcess me = new ProjectProcess();

    public Page<ProjectProcess> paginate(String currentPage, String pageSize, String content, String projectId) {
        String sql = " from process where projectId="+projectId+" ";
        if (content!=null&&content.trim().length()!=0){
            sql+=" and (remark like '%"+content.trim()+"%' or work like '%"+content.trim()+"%' or result like '%"+content.trim()+"%')";
        }
        sql+=" order by id desc ";
        return paginate(Integer.parseInt(currentPage), Integer.parseInt(pageSize), " select * ", sql);
    }
}
