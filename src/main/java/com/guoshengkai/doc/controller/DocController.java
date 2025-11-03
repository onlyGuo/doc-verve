package com.guoshengkai.doc.controller;

import com.guoshengkai.doc.core.auth.NoLogin;
import com.guoshengkai.doc.entitys.Article;
import com.guoshengkai.doc.entitys.ArticleTitle;
import com.guoshengkai.doc.entitys.Classify;
import com.guoshengkai.doc.service.ArticleService;
import com.guoshengkai.doc.service.ClassifyService;
import com.guoshengkai.doc.utils.MarkdownToHtmlUtils;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequestMapping("doc")
public class DocController {

    @Resource
    private ClassifyService classifyService;

    @Resource
    private ArticleService articleService;

    @NoLogin
    @RequestMapping
    public String docHome(Model model){
        return docHome1(model);
    }

    @NoLogin
    @RequestMapping("/")
    public String docHome1(Model model){
        List<Classify> classifies = classifyService.listClassify();
        model.addAttribute("classifyList", classifies);
        if (!classifies.isEmpty()) {
            model.addAttribute("classifyId", classifies.get(0).getId());
            if (classifies.get(0).getChildren() != null && !classifies.get(0).getChildren().isEmpty()) {
                model.addAttribute("classifyId", classifies.get(0).getChildren().get(0).getId());
            }
            docHome2(model, model.getAttribute("classifyId").toString());
        }

        return "doc/index";
    }

    @NoLogin
    @RequestMapping("/{classifyId}-0")
    public String docHome2(Model model, @PathVariable String classifyId){
        int articleId = setClassifyId(model, classifyId);
        docHome3(model, classifyId, articleId + "");
        return "doc/index";
    }

    @NoLogin
    @RequestMapping("/{classifyId}-{articleId}")
    public String docHome3(Model model, @PathVariable String classifyId, @PathVariable String articleId){
        Article article = articleService.getArticle(Integer.parseInt(articleId));
        if (null == article) {
            article = new Article();
            article.setId(0);
            article.setContent("> 您访问的目录暂无文章");
            article.setTitle("404");
        }
        model.addAttribute("article", article);
        setClassifyId(model, classifyId);
        String content = MarkdownToHtmlUtils.markdownToHtmlExtensions(article.getContent());
        model.addAttribute("content", content);
        return "doc/index";
    }


    private int setClassifyId(Model model, String classifyId) {
        List<Classify> classifies = (List<Classify>) model.getAttribute("classifyList");
        if (null == classifies){
            classifies = classifyService.listClassify();
            model.addAttribute("classifyList", classifies);
        }
        model.addAttribute("classifyId", classifyId);
        model.addAttribute("parentClassifyId", classifyId);
        Map<Integer, Classify> classifyMap = new HashMap<>();
        for (Classify classify : classifies) {
            classifyMap.put(classify.getId(), classify);
            if (null != classify.getChildren() && !classify.getChildren().isEmpty()) {
                for (Classify child : classify.getChildren()) {
                    classifyMap.put(child.getId(), child);
                }
            }
        }
        Classify classifyEntity = classifyMap.get(Integer.parseInt(classifyId));
        if (null == classifyEntity){
            classifyEntity = new Classify();
            classifyEntity.setId(0);
            classifyEntity.setName("404");
        }
        model.addAttribute("classify", classifyEntity);

        List<ArticleTitle> articleTitles = articleService.getArticleTitles(Integer.parseInt(classifyId));
        model.addAttribute("articleTitles", articleTitles);

        int articleId = model.getAttribute("article") == null ? 0 :
                ((Article) Objects.requireNonNull(model.getAttribute("article"))).getId();
        if (articleId == 0) {
            if (!articleTitles.isEmpty()) {
                articleId = articleTitles.get(0).getId();
            }
        }

        // 上一篇
        int index = 0;
        for (int i = 0; i < articleTitles.size(); i++) {
            if (articleTitles.get(i).getId() == articleId) {
                index = i;
                break;
            }
        }
        ArticleTitle previousArticle = null;
        if (index > 0) {
            previousArticle = articleTitles.get(index - 1);
        }
        // 下一篇
        ArticleTitle nextArticle = null;
        if (index < articleTitles.size() - 1) {
            nextArticle = articleTitles.get(index + 1);
        }
        model.addAttribute("previousArticle", previousArticle);
        model.addAttribute("nextArticle", nextArticle);

        return articleId;
    }
}
