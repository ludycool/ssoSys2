package jifan.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("SysConfig数据表")
@Data 
@TableName("sys_config")
public class SysConfig {

  @ApiModelProperty("主键")
@TableId(type = IdType.AUTO)
private int cid;

  @ApiModelProperty("类型")
private String ctype;

  @ApiModelProperty("名称")
private String cname;

  @ApiModelProperty("值")
private String cvalue;

  @ApiModelProperty("排序")
private int orderid;

  @ApiModelProperty("备注")
private String remark;

  @ApiModelProperty("更新时间")
private Date updatetime;

  @ApiModelProperty("添加人")
private String createman;

  @ApiModelProperty("是否有效")
private boolean isvalid;

}

