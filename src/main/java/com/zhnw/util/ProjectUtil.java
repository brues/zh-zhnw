package com.zhnw.util;

import com.zhnw.zhnw.project.project.Project;
import com.zhnw.zhnw.purview.user.User;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by guoyibin on 15/4/28.
 *
 * 合同工具类
 */
public class ProjectUtil {

    /**
     * 根据业务类型的英文简称和业务类型的Id,生成最新的合同编号
     *
     * */
    public String getNewProjectContractNum(String enName, Long businessTypeId, User user){

        String year = new SimpleDateFormat("yyyy").format(new Date());
        String registerDate = new SimpleDateFormat("yyyyMM").format(new Date());
        String contractNum = registerDate+enName;
        List<Project> projects = Project.me.find("select * from project where zhId="+user.get("zhId")+" and businessTypeId = "+businessTypeId+" and contractNum like '"+year+"%' order by id desc");
        if (projects.size()==0){
            contractNum = contractNum+"001";
        }else{
            String con = projects.get(0).getStr("contractNum");
            int num = 0;
            if (con.length()>11){
                System.out.println(con.substring(8,11));
                num = Integer.parseInt(con.substring(8,11))+1;
            }else{
                num = Integer.parseInt(con.substring(con.length()-3))+1;
            }
            String numStr = null;
            if (num>=0&&num<=9){
                numStr = "00"+num;
            }else if(num>=10&&num<=99){
                numStr = "0"+num;
            }else{
                numStr = ""+num;
            }
            contractNum = contractNum+numStr;
        }
        return contractNum;
    }

}
