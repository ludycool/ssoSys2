package jifan.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("RmsRolemanubuttons数据表")
@Data 
@TableName("rms_rolemanubuttons")
public class RmsRolemanubuttons {

  @ApiModelProperty("主键")
@TableId(type = IdType.AUTO)
private int id;

  @ApiModelProperty("角色的Id")
private String roleid;

  @ApiModelProperty("菜单的按钮的Id")
private int menubuttonsid;

}

