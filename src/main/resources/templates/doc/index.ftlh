<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>{{主标题}} - AI图书馆</title>
    <link
            rel="stylesheet"
            href="//cdn.jsdelivr.net/npm/element-plus/dist/index.css"
    />
    <!-- Import Vue 3 -->
    <script src="//cdn.jsdelivr.net/npm/vue@3"></script>
    <!-- Import component library -->
    <script src="//cdn.jsdelivr.net/npm/element-plus"></script>
    <link rel="stylesheet" href="/css/doc-header.css">
    <link rel="stylesheet" href="/highlight/styles/github-dark.css">
</head>
<body>
<div id="app">
    <div>
        <el-container>
            <el-header class="page-header">
                <div class="logo">AI图书馆</div>
                <ul class="nav-list">
                    <li><a href="javascript:void(0);">栏目1</a></li>
                    <li class="active">
                        <a href="javascript:void(0);">栏目2</a>
                        <ul class="nav-dropdown">
                            <li class="submenu active"><a href="javascript:void(0);">子栏目2</a></li>
                            <li class="submenu"><a href="javascript:void(0);">子栏目2</a></li>
                            <li class="submenu"><a href="javascript:void(0);">子栏目2</a></li>
                        </ul>
                    </li>
                    <li><a href="javascript:void(0);">栏目3</a></li>
                </ul>
            </el-header>
            <el-container class="main-container">
                <el-aside>
                    <el-scrollbar style="max-height: calc(100vh - 61px); padding: 0 32px 0 12px;">
                        <div style="margin: 10px 0; font-size: 18px;">
                            栏目名称
                        </div>
                        <a class="left-nav-list-item active">
                            章节 111
                        </a>
                        <a v-for="item in 200" :key="item" class="left-nav-list-item" style="display: block">
                            章节 {{ item }}
                        </a>
                    </el-scrollbar>
                </el-aside>

                <el-main style="padding: 0;">
                    <el-scrollbar style="max-height: calc(100vh - 61px)" class="content">
                        <div style="max-width: 1400px; margin: auto;">
                            <div class="title">Table of Contents</div>
                            <div class="sub-title">
                                <div class="create-time">创建时间: 2222-22-22 22:22:22</div>
                                <div class="author">作者: OhPanda</div>
                            </div>
                            <div class="content-content">
                                <#noautoesc>
                                    ${content}
                                </#noautoesc>
                            </div>
                            <div class="content-footer">
                                <div class="before q-nav">
                                    <span>上一篇</span> <a href="javascript:void(0);">《惺惺惜惺惺》</a>
                                </div>
                                <div class="after q-nav">
                                    <span>下一篇</span> <a href="javascript:void(0);">《惺惺惜惺惺》</a>
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
    @import url("https://fontsapi.zeoseven.com/442/main/result.css");
    html,body,h1, h2, h3, h4, h5, h6,p, ul, li{
        margin: 0;
        padding: 0;
        border: 0;
    }
    html,body {
        scroll-behavior: smooth;
        background: white;
        color: #262B47;
        font-family: "Maple Mono NF CN", Quotes, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif;;
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
    .content-content h1,h2,h3{
        font-weight: bold;
        margin-bottom: 10px;
        margin-top: 15px;
    }
    /*.content-content h1:before,h2:before,h3:before {*/
    /*    */
    /*}*/
    .content-content h4,h5,h6{
        margin-top: 10px;
        margin-bottom: 5px;
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
    .content-content ul{
        list-style: none;
        padding-left: 0;
        margin: 15px 0;
    }
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
        font-family: "Maple Mono NF CN", Quotes, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif!important;
    }



</style>
</html>
