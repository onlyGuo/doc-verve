package com.guoshengkai.doc.controller.admin;

import com.guoshengkai.doc.entitys.Article;
import com.guoshengkai.doc.service.ArticleService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/v1/article")
public class AdminArticleController {

    @Resource
    private ArticleService articleService;

    @GetMapping("{classifyId}-0")
    public List<Article> getArticles(@PathVariable int classifyId) {
        return articleService.getArticles(classifyId);
    }

    @PostMapping
    public Article newArticle(@RequestBody Article article) {
        return articleService.createArticle(article);
    }

}
