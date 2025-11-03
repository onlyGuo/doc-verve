package com.guoshengkai.doc.service.impl;

import com.guoshengkai.doc.config.UserConfig;
import com.guoshengkai.doc.core.beans.Method;
import com.guoshengkai.doc.core.sql.where.C;
import com.guoshengkai.doc.dao.ArticleDao;
import com.guoshengkai.doc.dao.ArticleTitleDao;
import com.guoshengkai.doc.entitys.Article;
import com.guoshengkai.doc.entitys.ArticleTitle;
import com.guoshengkai.doc.service.ArticleService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Resource
    private ArticleDao articleDao;

    @Resource
    private ArticleTitleDao articleTitleDao;

    @Resource
    private UserConfig userConfig;


    @Override
    public List<Article> getArticles(int classifyId) {
        return articleDao.list(Method.where(Article::getClassifyId, C.EQ, classifyId));
    }

    @Override
    public List<ArticleTitle> getArticleTitles(int classifyId) {
        return articleTitleDao.list(Method.where(Article::getClassifyId, C.EQ, classifyId));
    }

    @Override
    public Article getArticle(int id) {
        return articleDao.get(id);
    }

    @Override
    public Article createArticle(Article article) {
        if (!StringUtils.hasText(article.getAuthor())){
            article.setAuthor(userConfig.getNickname());
        }
        article.setCreateTime(new Date());
        articleDao.add(article);
        return article;
    }

    @Override
    public void updateArticle(Article article) {
        articleDao.update(article);
    }

    @Override
    public void deleteArticle(int id) {
        articleDao.del(id);
    }
}
