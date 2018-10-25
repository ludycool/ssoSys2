package jifan.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("VSlUser数据表")
@Data 
@TableName("v_sl_user")
public class VSlUser {

  @ApiModelProperty("")
private String userid;

  @ApiModelProperty("")
private String nickname;

  @ApiModelProperty("")
private String signed;

  @ApiModelProperty("")
private String phone;

  @ApiModelProperty("")
private String address;

  @ApiModelProperty("")
private String loginname;

  @ApiModelProperty("")
private int scores;

  @ApiModelProperty("")
private Date createtime;

  @ApiModelProperty("")
private short states;

  @ApiModelProperty("")
private String truename;

  @ApiModelProperty("")
private String sex;

  @ApiModelProperty("")
private String imgeurl;

}

