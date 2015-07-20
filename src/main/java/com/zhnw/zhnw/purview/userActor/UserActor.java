package com.zhnw.zhnw.purview.userActor;

import com.jfinal.plugin.activerecord.Model;

/**
 * Created by guoyibin on 15/4/8.
 */
public class UserActor extends Model<UserActor> {
    public static final UserActor me = new UserActor();
}
