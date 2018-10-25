package jifan.ssosys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Api("RmsMenus数据表")
@Data 
@TableName("rms_menus")
public class RmsMenus {

  @ApiModelProperty("主键")
@TableId(type = IdType.AUTO)
private int id;

  @ApiModelProperty("上级Id")
private int parentmanuid;

  @ApiModelProperty("排序")
private int orderno;

  @ApiModelProperty("名称")
private String manuname;

  @ApiModelProperty("跳转地址")
private String url;

  @ApiModelProperty("图标")
private String icon;

  @ApiModelProperty("大图标")
private String micon;

  @ApiModelProperty("备注")
private String remarks;

  @ApiModelProperty("添加时间")
private Date createtime;

  @ApiModelProperty("更新时间")
private Date modifytime;

  @ApiModelProperty("是否可用")
private boolean isenable;

  @ApiModelProperty("是否显示")
private boolean isshow;

  @ApiModelProperty("")
private short typeid;

  @ApiModelProperty("值、编号")
private String valuename;

  @ApiModelProperty("公司id")
private int companyid;

  @ApiModelProperty("项目id")
private int projectid;

  @ApiModelProperty("")
private short level;

}

