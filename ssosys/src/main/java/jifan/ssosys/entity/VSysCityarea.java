package jifan.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("VSysCityarea数据表")
@Data 
@TableName("v_sys_cityarea")
public class VSysCityarea {

  @ApiModelProperty("")
private int cityareaid;

  @ApiModelProperty("")
private int parentid;

  @ApiModelProperty("")
private String tname;

  @ApiModelProperty("")
private String tcode;

  @ApiModelProperty("")
private int areatypes;

  @ApiModelProperty("")
private String icon;

  @ApiModelProperty("")
private String remarks;

  @ApiModelProperty("")
private Date createtime;

  @ApiModelProperty("")
private Date updatetime;

  @ApiModelProperty("")
private boolean isvalid;

  @ApiModelProperty("")
private boolean isdeleted;

  @ApiModelProperty("")
private String areatypesname;

  @ApiModelProperty("")
private int orderno;

}

