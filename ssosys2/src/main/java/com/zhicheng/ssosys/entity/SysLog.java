package com.zhicheng.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("SysLog数据表")
@Data 
@TableName("sys_log")
public class SysLog {

  @ApiModelProperty("主键")
@TableId(type = IdType.AUTO)
private long id;

  @ApiModelProperty("操作名称")
private String oname;

  @ApiModelProperty("操作内容")
private String ocontent;

  @ApiModelProperty("操作地址")
private String url;

  @ApiModelProperty("操人id")
private String people_id;

  @ApiModelProperty("操作人名称")
private String people_name;

  @ApiModelProperty("操作权限")
private String permission;

  @ApiModelProperty("ip")
private String ip;

  @ApiModelProperty("添加时间")
private Date createtime;

  @ApiModelProperty("是否删除")
private boolean del_flag;

}

