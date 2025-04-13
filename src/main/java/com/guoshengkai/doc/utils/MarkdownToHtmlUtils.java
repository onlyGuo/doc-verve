package com.guoshengkai.doc.utils;

import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.commonmark.Extension;
import org.commonmark.ext.gfm.tables.TableBlock;
import org.commonmark.ext.gfm.tables.TablesExtension;
import org.commonmark.ext.heading.anchor.HeadingAnchorExtension;
import org.commonmark.node.Link;
import org.commonmark.node.Node;
import org.commonmark.parser.Parser;
import org.commonmark.renderer.html.AttributeProvider;
import org.commonmark.renderer.html.AttributeProviderContext;
import org.commonmark.renderer.html.AttributeProviderFactory;
import org.commonmark.renderer.html.HtmlRenderer;

/**
 * markdown转换成HTML工具类
 * @author 郭胜凯
 */
public class MarkdownToHtmlUtils {

    /**
     * markdown格式转换成HTML格式
     * @param markdown
     *      markdown格式的文本
     * @return
     *      HTML格式的文本
     */
    public static String markdownToHtml(String markdown) {
        Parser parser = Parser.builder().build();
        Node document = parser.parse(markdown);
        HtmlRenderer renderer = HtmlRenderer.builder().build();
        return renderer.render(document);
    }

    /**
     * 增加扩展[标题锚点，表格生成]
     * Markdown转换成HTML
     * @param markdown
     *      markdown格式的文本
     * @return
     *      HTML格式的文本
     */
    public static String markdownToHtmlExtensions(String markdown) {
        //h标题生成id
        Set<Extension> headingAnchorExtensions = Collections.singleton(HeadingAnchorExtension.create());
        //转换table的HTML
//        List<Extension> tableExtension = Arrays.asList(TablesExtension.create());
        List<Extension> tableExtension = Collections.singletonList(TablesExtension.create());
        Parser parser = Parser.builder()
                .extensions(tableExtension)
                .build();
        Node document = parser.parse(markdown);
        HtmlRenderer renderer = HtmlRenderer.builder()
                .extensions(headingAnchorExtensions)
                .extensions(tableExtension)
                .attributeProviderFactory(new AttributeProviderFactory() {
                    @Override
                    public AttributeProvider create(AttributeProviderContext context) {
                        return new CustomAttributeProvider();
                    }
                })
                .build();
        return renderer.render(document);
    }

    /**
     * 处理标签的属性
     */
    static class CustomAttributeProvider implements AttributeProvider {
        @Override
        public void setAttributes(Node node, String tagName, Map<String, String> attributes) {
            //改变a标签的target属性为_blank
            if (node instanceof Link) {
                attributes.put("target", "_blank");
            }
            if (node instanceof TableBlock) {
                attributes.put("class", "ui celled table");
            }
        }
    }

    public static void main(String[] args) throws IOException {
        String src = """
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
                
                """;
        System.out.println(markdownToHtmlExtensions(src));
    }

}
