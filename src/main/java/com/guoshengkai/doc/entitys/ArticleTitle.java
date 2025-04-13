package com.guoshengkai.doc.entitys;

import com.guoshengkai.doc.core.annotation.po.FieldName;
import com.guoshengkai.doc.core.annotation.po.ID;
import com.guoshengkai.doc.core.annotation.po.TableName;
import com.guoshengkai.doc.core.beans.PO;
import lombok.Getter;
import lombok.Setter;

/**
 * 文章标题
 */
@Getter
@Setter
@TableName(name = "DOC_ARTICLE")
public class ArticleTitle extends PO {

    @ID
    private int id;

    @FieldName(name = "CLASSIFY_ID")
    private int classifyId;

    @FieldName(name = "DOC_TITLE")
    private String title;
}
