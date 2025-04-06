package com.guoshengkai.doc.core.annotation.po;



import com.guoshengkai.doc.core.enums.BigFieldType;

import java.lang.annotation.*;

@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface BigField {
    BigFieldType value() default BigFieldType.CLOB;
}
