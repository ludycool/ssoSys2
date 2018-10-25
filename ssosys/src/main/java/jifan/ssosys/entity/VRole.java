package jifan.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("VRole数据表")
@Data 
@TableName("v_role")
public class VRole {

  @ApiModelProperty("")
private String id;

  @ApiModelProperty("")
private String rolename;

  @ApiModelProperty("")
private String remarks;

  @ApiModelProperty("")
private String createby;

  @ApiModelProperty("")
private Date createtime;

  @ApiModelProperty("")
private String modifyby;

  @ApiModelProperty("")
private Date modifytime;

  @ApiModelProperty("")
private short roletypes;

  @ApiModelProperty("")
private String roletypesname;

  @ApiModelProperty("")
private int companyid;

  @ApiModelProperty("")
private int projectid;

  @ApiModelProperty("")
private String projectname;

  @ApiModelProperty("")
private String jurisdiction;

}

