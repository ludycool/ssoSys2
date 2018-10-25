package jifan.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("SysCityarea数据表")
@Data 
@TableName("sys_cityarea")
public class SysCityarea {

  @ApiModelProperty("主键")
@TableId(type = IdType.AUTO)
private int cityareaid;

  @ApiModelProperty("父级")
private int parentid;

  @ApiModelProperty("名称")
private String tname;

  @ApiModelProperty("代号")
private String tcode;

  @ApiModelProperty("排序")
private int orderno;

  @ApiModelProperty("类型（类型 0市 1 区 2 省）")
private int areatypes;

  @ApiModelProperty("图标")
private String icon;

  @ApiModelProperty("备注")
private String remarks;

  @ApiModelProperty("添加时间")
private Date createtime;

  @ApiModelProperty("修改时间")
private Date updatetime;

  @ApiModelProperty("")
private boolean isvalid;

  @ApiModelProperty("")
private boolean isdeleted;

}

