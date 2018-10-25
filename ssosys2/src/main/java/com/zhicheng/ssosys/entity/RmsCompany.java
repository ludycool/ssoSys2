package com.zhicheng.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("RmsCompany数据表")
@Data 
@TableName("rms_company")
public class RmsCompany {

  @ApiModelProperty("主键")
@TableId(type = IdType.AUTO)
private int id;

  @ApiModelProperty("排序")
private int orderno;

  @ApiModelProperty("名称")
private String name;

  @ApiModelProperty("备注")
private String remarks;

  @ApiModelProperty("添加时间")
private Date createtime;

  @ApiModelProperty("更新时间")
private Date modifytime;

  @ApiModelProperty("是否删除")
private boolean del_flag;

}

