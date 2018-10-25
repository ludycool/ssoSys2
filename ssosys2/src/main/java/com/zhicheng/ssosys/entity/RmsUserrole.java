package com.zhicheng.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("RmsUserrole数据表")
@Data 
@TableName("rms_userrole")
public class RmsUserrole {

  @ApiModelProperty("主键")
@TableId(type = IdType.AUTO)
private long id;

  @ApiModelProperty("用户的Id")
private String userid;

  @ApiModelProperty("角色的Id")
private String roleid;

}

