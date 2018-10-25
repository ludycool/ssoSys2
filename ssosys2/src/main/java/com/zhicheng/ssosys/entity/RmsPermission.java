package com.zhicheng.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("RmsPermission数据表")
@Data 
@TableName("rms_permission")
public class RmsPermission {

  @ApiModelProperty("主键")
@TableId(type = IdType.AUTO)
private int id;

  @ApiModelProperty("上级Id")
private int parentid;

  @ApiModelProperty("排序")
private int orderno;

  @ApiModelProperty("名称")
private String pname;

  @ApiModelProperty("类型(0菜单，1按钮)")
private short typeid;

  @ApiModelProperty("跳转地址(或方法名)")
private String url;

  @ApiModelProperty("权限标识符")
private String pcode;

  @ApiModelProperty("图标")
private String icon;

  @ApiModelProperty("颜色")
private String color;

  @ApiModelProperty("添加时间")
private Date createtime;

  @ApiModelProperty("更新时间")
private Date modifytime;

  @ApiModelProperty("是否删除")
private boolean del_flag;

  @ApiModelProperty("是否显示")
private boolean show_flag;

  @ApiModelProperty("公司id")
private int companyid;

  @ApiModelProperty("项目id")
private int projectid;

  @ApiModelProperty("备注")
private String remarks;

  @ApiModelProperty("按钮id")
private int buttonid;
  @ApiModelProperty("等级")
  private int level;
}

