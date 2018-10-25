package jifan.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("RmsRole数据表")
@Data 
@TableName("rms_role")
public class RmsRole {

  @ApiModelProperty("主键")
@TableId(type = IdType.UUID)
private String id;

  @ApiModelProperty("角色名称")
private String rolename;

  @ApiModelProperty("备注")
private String remarks;

  @ApiModelProperty("创建人")
private String createby;

  @ApiModelProperty("修改人")
private String modifyby;

  @ApiModelProperty("添加时间")
private Date createtime;

  @ApiModelProperty("修改时间")
private Date modifytime;

  @ApiModelProperty("")
private short roletypes;

  @ApiModelProperty("权限 的json数据")
private String jurisdiction;

  @ApiModelProperty("公司id")
private int companyid;

  @ApiModelProperty("项目id")
private int projectid;

}

