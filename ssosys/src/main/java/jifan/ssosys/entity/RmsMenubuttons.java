package jifan.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("RmsMenubuttons数据表")
@Data 
@TableName("rms_menubuttons")
public class RmsMenubuttons {

  @ApiModelProperty("主键")
@TableId(type = IdType.AUTO)
private int id;

  @ApiModelProperty("按钮的Id")
private int buttonid;

  @ApiModelProperty("菜单Id")
private int manuid;

  @ApiModelProperty("排序")
private int orderno;

}

