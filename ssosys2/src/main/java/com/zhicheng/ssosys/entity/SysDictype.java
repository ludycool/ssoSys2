package com.zhicheng.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("SysDictype数据表")
@Data 
@TableName("sys_dictype")
public class SysDictype {

  @ApiModelProperty("主键")
@TableId(type = IdType.AUTO)
private int dictypeid;

  @ApiModelProperty("字典类型名称")
private String dictypename;

  @ApiModelProperty("字典类型编号")
private String dictypenum;

  @ApiModelProperty("图标")
private String icon;

  @ApiModelProperty("备注")
private String remarks;

  @ApiModelProperty("排序号")
private int orderid;

  @ApiModelProperty("添加时间")
private Date createtime;

  @ApiModelProperty("是否删除")
private boolean del_flag;

}

