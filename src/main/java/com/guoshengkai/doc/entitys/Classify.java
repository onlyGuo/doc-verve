package com.guoshengkai.doc.entitys;

import com.guoshengkai.doc.core.annotation.po.FieldName;
import com.guoshengkai.doc.core.annotation.po.ID;
import com.guoshengkai.doc.core.annotation.po.TableName;
import com.guoshengkai.doc.core.annotation.po.TempField;
import com.guoshengkai.doc.core.beans.PO;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * 栏目分类
 */
@Getter
@Setter
@TableName(name = "DOC_CLASSIFY")
public class Classify extends PO {

    @ID
    private int id;

    @FieldName(name = "PARENT_ID")
    private int parentId;

    @FieldName(name = "CLASSIFY_NAME")
    private String name;

    @TempField
    private List<Classify> children;

}
