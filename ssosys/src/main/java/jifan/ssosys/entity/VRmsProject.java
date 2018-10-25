package jifan.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("VRmsProject数据表")
@Data 
@TableName("v_rms_project")
public class VRmsProject {

  @ApiModelProperty("")
private int id;

  @ApiModelProperty("")
private int companyid;

  @ApiModelProperty("")
private String keys;

  @ApiModelProperty("")
private String name;

  @ApiModelProperty("")
private String remarks;

  @ApiModelProperty("")
private Date createtime;

  @ApiModelProperty("")
private Date modifytime;

  @ApiModelProperty("")
private boolean isvalid;

  @ApiModelProperty("")
private boolean isdeleted;

  @ApiModelProperty("")
private String companyname;

}

