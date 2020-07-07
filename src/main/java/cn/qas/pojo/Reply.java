package cn.qas.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply {

  private int replyId;  //回复id
  private int userId; //回复人id
  private int tipId;  //被回复贴id
  private String replyContent;  //回复内容
  private Date replyPublishTime;  //回复发表时间
  private Date replyModifyTime; //回复修改时间
  private int replyIsDeleted; //是否删除，0-否，1-逻辑删除


}
