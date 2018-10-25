package com.zhicheng.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("SysFiles数据表")
@Data 
@TableName("sys_files")
public class SysFiles {

  @ApiModelProperty("主键")
@TableId(type = IdType.AUTO)
private long fileid;

  @ApiModelProperty("所禹对象Id")
private String toid;

  @ApiModelProperty("显示名称")
private String showname;

  @ApiModelProperty("文件名")
private String filename;

  @ApiModelProperty("来源表（某个数据表）")
private String sourcetable;

  @ApiModelProperty("相对路径")
private String relativepath;

  @ApiModelProperty("路由")
private String route;

  @ApiModelProperty("后缀名")
private String suffix;

  @ApiModelProperty("文件属性类型（中文）")
private String filetype;

  @ApiModelProperty("添加时间")
private Date addtime;

  @ApiModelProperty("是否删除")
private boolean del_flag;

}

