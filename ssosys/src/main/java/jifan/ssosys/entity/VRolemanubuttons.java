package jifan.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("VRolemanubuttons数据表")
@Data 
@TableName("v_rolemanubuttons")
public class VRolemanubuttons {

  @ApiModelProperty("")
private String roleid;

  @ApiModelProperty("")
private int manuid;

  @ApiModelProperty("")
private int orderno;

  @ApiModelProperty("")
private String remarks;

  @ApiModelProperty("")
private Date createtime;

  @ApiModelProperty("")
private Date modifytime;

  @ApiModelProperty("")
private String valuename;

  @ApiModelProperty("")
private String functionname;

  @ApiModelProperty("")
private String buttonname;

  @ApiModelProperty("")
private int id;

  @ApiModelProperty("")
private String icon;

  @ApiModelProperty("")
private String color;

}

