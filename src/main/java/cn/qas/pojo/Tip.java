package cn.qas.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Tip {

  private int tipId;  //贴子id
  private int userId; //楼主id
  private int tabId;  //分类id
  private String tipTitle;  //标题
  private String tipContent;  //内容
  private Date tipPublishTime;  //发表时间
  private Date tipModifyTime; //更新时间
  private int tipClick; //贴子点击量
  private int tipIsDeleted; //是否逻辑删除，0否，1是
  private int tipIsKnot;  //是否结贴，0否，1结贴
  private int tipReplies; //贴子回复数
  private int tipIsTop; //是否置顶，0-否，1-是
  private Date tipTopTime;  //置顶时间



}
