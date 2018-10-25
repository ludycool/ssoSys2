package jifan.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("VMenubuttons数据表")
@Data 
@TableName("v_menubuttons")
public class VMenubuttons {

  @ApiModelProperty("")
private int manuid;

  @ApiModelProperty("")
private int orderno;

  @ApiModelProperty("")
private int id;

  @ApiModelProperty("")
private String buttonname;

  @ApiModelProperty("")
private String remarks;

  @ApiModelProperty("")
private Date createtime;

  @ApiModelProperty("")
private Date modifytime;

  @ApiModelProperty("")
private String valuename;

  @ApiModelProperty("")
private int menubuttonsid;

  @ApiModelProperty("")
private String functionname;

  @ApiModelProperty("")
private String icon;

}

