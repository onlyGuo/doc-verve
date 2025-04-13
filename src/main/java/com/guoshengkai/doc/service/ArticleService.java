package com.guoshengkai.doc.service;

import com.guoshengkai.doc.entitys.Article;
import com.guoshengkai.doc.entitys.ArticleTitle;

import java.util.List;

/**
 * 文章管理
 */
public interface ArticleService {

    /**
     * 列出详细文章列表
     * @param classifyId
     *      栏目ID
     * @return
     *      文章列表
     */
    List<Article> getArticles(int classifyId);

    /**
     * 列出文章标题列表
     * @param classifyId
     *      栏目ID
     * @return
     *      文章标题列表
     */
    List<ArticleTitle> getArticleTitles(int classifyId);

    /**
     * 查看文章详情
     * @param id
     *      文章ID
     * @return
     *      文章详情
     */
    Article getArticle(int id);

    /**
     * 创建文章
     * @param article
     *      文章信息
     * @return
     *      文章信息
     */
    Article createArticle(Article article);

    /**
     * 更新文章详情
     * @param article
     *      文章信息
     */
    void updateArticle(Article article);

    /**
     * 删除文章
     * @param id
     *      文章ID
     */
    void deleteArticle(int id);
}
