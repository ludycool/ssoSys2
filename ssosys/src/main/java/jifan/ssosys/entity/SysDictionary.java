package jifan.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("SysDictionary数据表")
@Data 
@TableName("sys_dictionary")
public class SysDictionary {

  @ApiModelProperty("字典主键")
@TableId(type = IdType.AUTO)
private int dicid;

  @ApiModelProperty("字典组（类型）")
private int dictypeid;

  @ApiModelProperty("上级id")
private int parentid;

  @ApiModelProperty("字典名称")
private String dicname;

  @ApiModelProperty("字典类型编号")
private String dicno;

  @ApiModelProperty("图标")
private String icon;

  @ApiModelProperty("备注")
private String remarks;

  @ApiModelProperty("排序号")
private int orderid;

  @ApiModelProperty("添加时间")
private Date createtime;

  @ApiModelProperty("是否有效")
private boolean isvalid;

  @ApiModelProperty("是否删除")
private boolean isdeleted;

}

