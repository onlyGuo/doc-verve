package com.guoshengkai.doc.controller;

import com.guoshengkai.doc.core.auth.NoLogin;
import com.guoshengkai.doc.utils.MarkdownToHtmlUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("doc")
public class DocController {

    @NoLogin
    @RequestMapping
    public String docHome(Model model){
        return docHome1(model);
    }

    @NoLogin
    @RequestMapping("/")
    public String docHome1(Model model){
        String title = "文档";
        String content = MarkdownToHtmlUtils.markdownToHtmlExtensions("""
                ## 😲 md-editor-v3
                
                Markdown 编辑器，vue3 版本，使用 jsx 模板 和 typescript 开发，支持切换主题、prettier 美化文本等。
                
                ### 🤖 基本演示
                
                **加粗**，<u>下划线</u>，_斜体_，~~删除线~~，上标^26^，下标~1~，`inline code`，[超链接](https://github.com/imzbf)
                
                > 引用：《I Have a Dream》
                
                1. So even though we face the difficulties of today and tomorrow, I still have a dream.
                2. It is a dream deeply rooted in the American dream.
                3. I have a dream that one day this nation will rise up.
                
                - [ ] 周五
                - [ ] 周六
                - [x] 周天
                
                ![图片](https://imzbf.github.io/md-editor-rt/imgs/mark_emoji.gif)
                
                ## 🤗 代码演示
                
                ```java
                public static void main(String[] args) {
                    System.out.println("hello");
                }
                ```
                
                ## 🖨 文本演示
                
                依照普朗克长度这项单位，目前可观测的宇宙的直径估计值（直径约 930 亿光年，即 8.8 × 10<sup>26</sup> 米）即为 5.4 × 10<sup>61</sup>倍普朗克长度。而可观测宇宙体积则为 8.4 × 10<sup>184</sup>立方普朗克长度（普朗克体积）。
                
                ## 📈 表格演示
                
                | 表头1  |  表头2   |  表头3 |
                | :----- | :------: | -----: |
                | 左对齐 | 中间对齐 | 右对齐 |
                
                ## 📏 公式
                
                行内：$x+y^{2x}$
                
                $$
                \\sqrt[3]{x}
                $$
                
                ## 🧬 图表
                
                ```mermaid
                flowchart TD
                  Start --> Stop
                ```
                
                ## 🪄 提示
                
                !!! note 支持的类型
                
                note、abstract、info、tip、success、question、warning、failure、danger、bug、example、quote、hint、caution、error、attention
                
                !!!
                
                ## ☘️ 占个坑@！
                """);
        model.addAttribute("content", content);
        return "doc/index";
    }
}
