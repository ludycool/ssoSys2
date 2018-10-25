package jifan.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("VUserrole数据表")
@Data 
@TableName("v_userrole")
public class VUserrole {

  @ApiModelProperty("")
private String id;

  @ApiModelProperty("")
private String loginname;

  @ApiModelProperty("")
private String truename;

  @ApiModelProperty("")
private String password;

  @ApiModelProperty("")
private Date createtime;

  @ApiModelProperty("")
private Date modifytime;

  @ApiModelProperty("")
private int departmentid;

  @ApiModelProperty("")
private String roleid;

  @ApiModelProperty("")
private String rolename;

  @ApiModelProperty("")
private int usertype;

  @ApiModelProperty("")
private String phone;

  @ApiModelProperty("")
private String departmentname;

  @ApiModelProperty("")
private String jurisdiction;

  @ApiModelProperty("")
private int companyid;

  @ApiModelProperty("")
private String companyname;

  @ApiModelProperty("")
private String projectname;

}

