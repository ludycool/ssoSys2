package com.zhicheng.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("RmsButtons数据表")
@Data 
@TableName("rms_buttons")
public class RmsButtons {

  @ApiModelProperty("主键")
@TableId(type = IdType.AUTO)
private int id;

  @ApiModelProperty("排序")
private int orderno;

  @ApiModelProperty("名称")
private String buttonname;

  @ApiModelProperty("值")
private String valuename;

  @ApiModelProperty("图标")
private String icon;

  @ApiModelProperty("方法名")
private String functionname;

  @ApiModelProperty("备注")
private String remarks;

  @ApiModelProperty("添加时间")
private Date createtime;

  @ApiModelProperty("更新时间")
private Date modifytime;

  @ApiModelProperty("颜色")
private String color;

  @ApiModelProperty("是否删除")
private boolean del_flag;

}

