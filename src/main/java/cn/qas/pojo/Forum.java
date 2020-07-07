package cn.qas.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Forum {

  private int forumId;  //版块id
  private String forumName; //版块名
  private int forumIsDeleted; //是否删除，0-否，1-逻辑删除
  private Date forumCreateTime; //创建时间
  private Date forumModifyTime; //修改时间

}
