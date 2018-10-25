package jifan.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("VRolemanus数据表")
@Data 
@TableName("v_rolemanus")
public class VRolemanus {

  @ApiModelProperty("")
private int manuid;

  @ApiModelProperty("")
private String roleid;

  @ApiModelProperty("")
private int parentmanuid;

  @ApiModelProperty("")
private String remarks;

  @ApiModelProperty("")
private int orderno;

  @ApiModelProperty("")
private String manuname;

  @ApiModelProperty("")
private String url;

  @ApiModelProperty("")
private boolean isshow;

  @ApiModelProperty("")
private boolean isenable;

  @ApiModelProperty("")
private String icon;

  @ApiModelProperty("")
private String micon;

  @ApiModelProperty("")
private short typeid;

  @ApiModelProperty("")
private String valuename;

  @ApiModelProperty("")
private short level;

}

