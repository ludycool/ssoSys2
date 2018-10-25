package jifan.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("RmsProject数据表")
@Data 
@TableName("rms_project")
public class RmsProject {

  @ApiModelProperty("主键")
@TableId(type = IdType.AUTO)
private int id;

  @ApiModelProperty("公司id")
private int companyid;

  @ApiModelProperty("加密key")
private String keyid;

  @ApiModelProperty("名称")
private String name;

  @ApiModelProperty("备注")
private String remarks;

  @ApiModelProperty("添加时间")
private Date createtime;

  @ApiModelProperty("更新时间")
private Date modifytime;

  @ApiModelProperty("是否有效")
private boolean isvalid;

  @ApiModelProperty("是否删除")
private boolean isdeleted;

}

