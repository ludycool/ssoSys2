package com.zhicheng.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("VUserRole数据表")
@Data 
@TableName("v_user_role")
public class VUserRole {

  @ApiModelProperty("角色的Id")
private String roleid;

  @ApiModelProperty("角色名称")
private String rolename;

  @ApiModelProperty("名称")
private String departmentname;

  @ApiModelProperty("权限")
private String jurisdiction;

  @ApiModelProperty("名称")
private String companyname;

  @ApiModelProperty("名称")
private String projectname;

  @ApiModelProperty("主键")
private String id;

  @ApiModelProperty("公司id")
private int companyid;

  @ApiModelProperty("部门主键")
private int departmentid;

  @ApiModelProperty("登录名")
private String loginname;

  @ApiModelProperty("姓名")
private String truename;

  @ApiModelProperty("密码")
private String password;

  @ApiModelProperty("添加时间")
private Date createtime;

  @ApiModelProperty("修改时间")
private Date modifytime;

  @ApiModelProperty("用户类型")
private int usertype;

  @ApiModelProperty("电话")
private String phone;

  @ApiModelProperty("是否删除")
private boolean del_flag;

}

