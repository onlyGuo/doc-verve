package com.guoshengkai.doc.entitys;

import com.guoshengkai.doc.core.annotation.po.FieldName;
import com.guoshengkai.doc.core.annotation.po.ID;
import com.guoshengkai.doc.core.annotation.po.TableName;
import com.guoshengkai.doc.core.beans.PO;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * 文章详情
 */
@Getter
@Setter
@TableName(name = "DOC_ARTICLE")
public class Article extends PO {

    @ID
    private int id;

    @FieldName(name = "CLASSIFY_ID")
    private int classifyId;

    @FieldName(name = "DOC_TITLE")
    private String title;

    @FieldName(name = "DOC_CONTENT")
    private String content;

    @FieldName(name = "DOC_EN_CONTENT")
    private String enContent;

    @FieldName(name = "AUTHOR")
    private String author;

    @FieldName(name = "CREATE_TIME")
    private Date createTime;

    @FieldName(name = "UPDATE_TIME")
    private Date updateTime;




}
