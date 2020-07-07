package cn.qas.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Tab {

  private int tabId;  //分类id
  private String tabName; //分类名
  private int forumId;  //版块id
  private int tabIsDeleted; //是否删除，0-否，1-逻辑删除
  private Date tabCreateTime; //创建时间
  private Date tabModifyTime; //修改时间
}
