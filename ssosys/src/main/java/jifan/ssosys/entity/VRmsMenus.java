package jifan.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("VRmsMenus数据表")
@Data 
@TableName("v_rms_menus")
public class VRmsMenus {

  @ApiModelProperty("")
private int projectid;

  @ApiModelProperty("")
private int companyid;

  @ApiModelProperty("")
private String valuename;

  @ApiModelProperty("")
private short typeid;

  @ApiModelProperty("")
private boolean isshow;

  @ApiModelProperty("")
private boolean isenable;

  @ApiModelProperty("")
private Date modifytime;

  @ApiModelProperty("")
private Date createtime;

  @ApiModelProperty("")
private String remarks;

  @ApiModelProperty("")
private String micon;

  @ApiModelProperty("")
private String icon;

  @ApiModelProperty("")
private String url;

  @ApiModelProperty("")
private String manuname;

  @ApiModelProperty("")
private int orderno;

  @ApiModelProperty("")
private int parentmanuid;

  @ApiModelProperty("")
private int id;

  @ApiModelProperty("")
private String projectname;

  @ApiModelProperty("")
private short level;

}

