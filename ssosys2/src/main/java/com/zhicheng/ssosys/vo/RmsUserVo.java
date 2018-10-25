package com.zhicheng.ssosys.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Data 
@ApiModel("RmsUserVo")
public class RmsUserVo {

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

  @ApiModelProperty("手机")
private String phone;

  @ApiModelProperty("公司id")
private int companyid;

}

