package jifan.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("RmsRolemanus数据表")
@Data 
@TableName("rms_rolemanus")
public class RmsRolemanus {

  @ApiModelProperty("主键")
@TableId(type = IdType.AUTO)
private int id;

  @ApiModelProperty("角色的Id")
private String roleid;

  @ApiModelProperty("菜单的Id")
private int manuid;

}

