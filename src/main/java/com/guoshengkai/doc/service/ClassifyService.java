package com.guoshengkai.doc.service;

import com.guoshengkai.doc.entitys.Classify;

import java.util.List;

/**
 * 文档业务
 */
public interface ClassifyService {

    /**
     * 列出栏目树
     * @return
     *      栏目树
     */
    List<Classify> listClassify();

    /**
     * 新建栏目
     * @param classify
     *      栏目信息
     * @return
     *      栏目信息
     */
    Classify createClassify(Classify classify);

    /**
     * 更新信息
     * @param classify
     *      栏目信息
     */
    void updateClassify(Classify classify);

    /**
     * 删除栏目
     * @param id
     *      栏目ID
     */
    void deleteClassify(Integer id);
}
