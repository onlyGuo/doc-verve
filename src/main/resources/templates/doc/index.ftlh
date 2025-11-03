<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><#if article ??>${article.title} - </#if>${classify.name} - AI图书馆</title>
    <link
            rel="stylesheet"
            href="${request.contextPath}/libs/element-plus/index.css"
    />
    <!-- Import Vue 3 -->
    <script src="${request.contextPath}/libs/vue@3/index.js"></script>
    <!-- Import component library -->
    <script src="${request.contextPath}/libs/element-plus/index.js"></script>
    <link rel="stylesheet" href="/css/doc-header.css">
    <link rel="stylesheet" href="/highlight/styles/github-dark.css">
    <link rel="stylesheet" href="/css/github-markdown.css">
</head>
<body>
<div id="app">
    <div>
        <el-container>
            <el-header class="page-header">
                <div class="logo">AI图书馆</div>
                <ul class="nav-list">
                    <#list classifyList as cls>
                        <li class="<#if cls.id == classify.id || (cls.id == classify.parentId && classify.parentId != 0)>active</#if>">
                            <#if cls.children ??>
                                <a href="javascript:void(0);">${cls.name}</a>
                            <#else>
                                <a href="/doc/${cls.id}-0">${cls.name}</a>
                            </#if>

                            <#if cls.children ??>
                                <ul class="nav-dropdown">
                                    <#list cls.children as subSlassify>
                                        <li class="submenu <#if subSlassify.id == cls.id>active</#if>">
                                            <a href="/doc/${subSlassify.id}-0">${subSlassify.name}</a>
                                        </li>
                                    </#list>
                                </ul>
                            </#if>
                        </li>
                    </#list>
                </ul>
            </el-header>
            <el-container class="main-container">
                <el-aside>
                    <el-scrollbar style="max-height: calc(100vh - 61px); padding: 0 32px 0 12px;">
                        <div style="margin: 10px 0; font-size: 18px;">
                            ${classify.name}
                        </div>
                        <#list articleTitles as articleTitle>
                            <a href="/doc/${articleTitle.classifyId}-${articleTitle.id}" class="left-nav-list-item <#if articleTitle.id == article.id>active</#if>">
                                ${articleTitle.title}
                            </a>
                        </#list>
                    </el-scrollbar>
                </el-aside>

                <el-main style="padding: 0;">
                    <el-scrollbar style="max-height: calc(100vh - 61px)" class="content">
                        <div style="max-width: 1400px; margin: auto;">
                            <div class="title">${article.title}</div>
                            <div class="sub-title">
                                <div class="create-time">创建时间: ${article.getCreateTimeStr()}</div>
                                <div class="author">作者: ${article.author ! 'OhPanda'}</div>
                            </div>
                            <div class="content-content markdown-body">
                                <#noautoesc>
                                    ${content}
                                </#noautoesc>
                            </div>
                            <div class="content-footer">
                                <div class="before q-nav" <#if previousArticle??>onclick="window.location.href='/doc/${previousArticle.classifyId}-${previousArticle.id}'"</#if>>
                                    <span>上一篇</span>
                                    <#if previousArticle??>
                                        <a href="/doc/${previousArticle.classifyId}-${previousArticle.id}">${previousArticle.title}</a>
                                    <#else>
                                        <a href="javascript:void(0);">无</a>
                                    </#if>
                                </div>
                                <div class="after q-nav" <#if nextArticle??>onclick="window.location.href='/doc/${nextArticle.classifyId}-${nextArticle.id}'"</#if>>
                                    <span>下一篇</span>
                                    <#if nextArticle??>
                                        <a href="/doc/${nextArticle.classifyId}-${nextArticle.id}">${nextArticle.title}</a>
                                    <#else>
                                        <a href="javascript:void(0);">无</a>
                                    </#if>
                                </div>
                            </div>
                        </div>
                    </el-scrollbar>
                </el-main>
            </el-container>
        </el-container>
    </div>
</div>
</body>
<script>
    const App = {
        data() {
            return {
                message: "Hello Element Plus",
            };
        },
    };
    const app = Vue.createApp(App);
    app.use(ElementPlus);
    app.mount("#app");
</script>
<script src="/highlight/highlight.min.js"></script>
<script>hljs.highlightAll();</script>
<style>
    /*@import url("https://fontsapi.zeoseven.com/442/main/result.css");*/
    html,body,h1, h2, h3, h4, h5, h6,p, ul, li{
        margin: 0;
        padding: 0;
        border: 0;
    }
    html,body {
        scroll-behavior: smooth;
        background: white;
        color: #262B47;
        /*font-family: "Maple Mono NF CN", Quotes, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif;;*/
    }
    .left-nav-list-item{
        display: block;
        line-height: 38px;
        font-size: 16px;
        color: #999;
        text-decoration: none;
        padding: 0 10px;
        border-radius: 4px;
        transition: all 0.3s;
        background: rgba(0,0,0,0);
        border-left:  solid 2px transparent;
        cursor: pointer;
        margin-left: 20px;
    }
    .left-nav-list-item:hover{
        color: #4294E3;
    }
    .left-nav-list-item.active{
        background: rgba(64, 158, 255,0.1);
        border-left:  solid 2px #4294E3;
        color: #4294E3;
    }
    .content{
        padding-right: 10px;
    }
    .content .title{
        font-size: 30px;
        font-weight: bold;
        margin-bottom: 10px;
    }
    .content .create-time, .author{
        font-size: 14px;
        color: #999;
        line-height: 20px;
        font-weight: normal;
    }
    .content .sub-title{
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
    }
    .content-footer{
        display: flex;
        justify-content: space-between;
        margin-top: 10px;
        border-top:  1px solid #ddd;
        padding-top: 10px;
    }
    .content-footer a{
        color: #3594f7;
        text-decoration: none;
        transition: color .3s;
    }
    .content-footer .q-nav{
        display: block;
        padding: 20px 10px;
        border:  1px solid #ddd;
        border-radius: 4px;
        width: calc(50% - 40px);
        cursor: pointer;
    }
    .content-footer .q-nav:hover{
        border:   1px solid #3594f7;
    }
    .content-footer .q-nav span{
        display: block;
    }

    .content-content img{
        max-width: 100%;
    }
    .content-content table {
        border-collapse: collapse; /* 合并边框，避免双线 */
        width: 100%; /* 可选，让表格宽度自适应 */
    }

    .content-content th, td {
        border: 1px solid #CCC; /* 黑色细实线 */
        padding: 8px;           /* 单元格内边距 */
        text-align: left;       /* 可根据需要修改对齐方式 */
    }
    .content-content h1,h2,h3{
        font-weight: bold;
        margin-bottom: 10px;
        margin-top: 35px;
    }
    /*.content-content h1:before,h2:before,h3:before {*/
    /*    */
    /*}*/
    .content-content h4,h5,h6{
        margin-top: 10px;
        margin-bottom: 5px;
    }
    .content-content strong{
        font-weight: bold;
    }
    .content-content p{
        margin: 5px 0 7px 0;
    }
    .content-content code{
        color: #3594f7;
        padding: 4px;
        background: rgba(59, 170, 250, .1);
        border-radius: 2px;
    }
    .content-content a{
        color: #3594f7;
        text-decoration: none;
        transition: color .3s;
    }
    .content-content a:after{
        background-color: #3594f7;
        content: "";
        display: inline-block;
        height: 16px;
        margin-left: 2px;
        mask-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-square-arrow-out-up-right"><path d="M21 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h6"/><path d="m21 3-9 9"/><path d="M15 3h6v6"/></svg>');
        width: 16px;
    }
    .content-content a:hover{
        color: #42b883;
    }
    .content-content blockquote{
        display: block;
        margin: 20px 0;
        overflow: auto;
        padding: 10px 20px;
        background-color: #ececec;
        border-left: 5px solid #35b378;
    }
    .content-content hr{
        display: block;
        height: 0;
        border: none;
        border-top: 1px solid #ddd;
        margin: 20px 0;
    }
    /*.content-content ul{*/
    /*    list-style: none;*/
    /*    padding-left: 0;*/
    /*    margin: 15px 0;*/
    /*}*/
    .content-content pre{
        display: block;
        background-color: #2b2b2b;
        padding: 10px;
        border-radius: 10px;
        font-size: 15px;
        line-height: 1.5;
    }
    .content-content pre code{
        background: none;
        color: #fff;
        padding: 0;
        margin: 0;
        /*font-family: "Maple Mono NF CN", Quotes, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif!important;*/
    }



</style>
</html>
