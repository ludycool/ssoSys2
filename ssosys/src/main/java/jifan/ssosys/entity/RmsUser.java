package jifan.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("RmsUser数据表")
@Data 
@TableName("rms_user")
public class RmsUser {

  @ApiModelProperty("主键")
@TableId(type = IdType.UUID)
private String id;

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

