package jifan.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("Sysitem数据表")
@Data 
@TableName("sysitem")
public class Sysitem {

  @ApiModelProperty("主键")
@TableId(type = IdType.AUTO)
private int id;

  @ApiModelProperty("类型")
private String itemtype;

  @ApiModelProperty("值")
private String itemvalue;

  @ApiModelProperty("名称")
private String itemname;

  @ApiModelProperty("图标地址")
private String icon;

  @ApiModelProperty("排序")
private int orderid;

  @ApiModelProperty("备注")
private String remark;

  @ApiModelProperty("添加时间")
private String createtime;

  @ApiModelProperty("添加人")
private String createman;

  @ApiModelProperty("是否有效")
private boolean isvalid;

  @ApiModelProperty("是否删除")
private boolean isdeleted;

}

