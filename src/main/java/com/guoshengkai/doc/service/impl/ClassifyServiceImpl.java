package com.guoshengkai.doc.service.impl;

import com.guoshengkai.doc.core.beans.Method;
import com.guoshengkai.doc.core.exception.ValidationException;
import com.guoshengkai.doc.core.sql.where.C;
import com.guoshengkai.doc.dao.ArticleDao;
import com.guoshengkai.doc.dao.ArticleTitleDao;
import com.guoshengkai.doc.dao.ClassifyDao;
import com.guoshengkai.doc.entitys.ArticleTitle;
import com.guoshengkai.doc.entitys.Classify;
import com.guoshengkai.doc.service.ClassifyService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class ClassifyServiceImpl implements ClassifyService {

    @Resource
    private ClassifyDao classifyDao;

    @Resource
    private ArticleTitleDao articleTitleDao;

    @Override
    public List<Classify> listClassify() {
        List<Classify> list = classifyDao.list(Method.createDefault());
        Map<Integer, Classify> collect = list.stream().collect(Collectors.toMap(Classify::getId, a -> a));
        List<Classify> result = new LinkedList<>();
        list.forEach(classify -> {
           if (classify.getParentId() == 0){
               result.add(classify);
           }else{
               Classify parent = collect.get(classify.getParentId());
               if (null != parent) {
                   if (parent.getChildren() == null){
                       parent.setChildren(new LinkedList<>());
                   }
                   parent.getChildren().add(classify);
               }
           }
        });
        return result;
    }

    @Override
    public Classify createClassify(Classify classify) {
        classifyDao.add(classify);
        return classify;
    }

    @Override
    public void updateClassify(Classify classify) {
        classifyDao.update(classify);
    }

    @Override
    public void deleteClassify(Integer id) {
        if (articleTitleDao.isExist(Method.where(ArticleTitle::getClassifyId, C.EQ, id))){
            throw new ValidationException("栏目中有文章，请先处理文章后再删除");
        }
        classifyDao.del(id);
    }
}
