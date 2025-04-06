<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>{{主标题}} - AI图书馆</title>
</head>
<body>
<div class="page-header">
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
</div>
<div class="page-content">
    <div class="left-nav">
        <div class="left-nav-title">
            章节目录
        </div>
        <div class="left-nav-list">
            <div class="left-nav-list-item">
                章节1111
            </div>
            <div class="left-nav-list-item">
                章节1111
            </div>
            <div class="left-nav-list-item">
                章节1111
            </div>
        </div>
    </div>
    <div class="content">
        <div class="title">Table of Contents</div>
        <div class="sub-title">
            <div class="create-time">创建时间: 2222-22-22 22:22:22</div>
            <div class="author">作者: OhPanda</div>
        </div>
        <div class="content-content">
            xxxxxxxxxx
        </div>
        <div class="content-footer">
            <div class="before">
                上一篇 <a href="javascript:void(0);">《惺惺惜惺惺》</a>
            </div>
            <div class="after">
                下一篇 <a href="javascript:void(0);">《惺惺惜惺惺》</a>
            </div>
        </div>
    </div>
</div>
</body>
<style>
    html,body,h1, h2, h3, h4, h5, h6,p, ul, li{
        margin: 0;
        padding: 0;
        border: 0;
    }
    html,body {
        scroll-behavior: smooth;
        background: white;
        color: #262B47;
    }
    .page-header{
        padding: 10px;
        border-bottom: 1px solid #ddd;
        display: flex;
        justify-content: space-between;
    }
    .page-header .logo{
        font-size: 30px;
        font-weight: bold;
        text-decoration: none;
    }
    .page-header .nav-list{
        display: flex;
        justify-content: space-between;
        list-style-type: none;
        margin: 0;
        padding: 0;
        font-size: 20px;
        line-height: 41px;
    }
    .page-header .nav-list a{
        text-decoration: none;
        color: inherit;
    }
    .page-header .nav-list li{
        position: relative;
        padding: 0 10px;
        font-size: 16px;
    }
    .page-header .nav-list .active a{
        color: #4294E3;
    }
    .page-header .nav-list .nav-dropdown{
        list-style-type: none;
        position: absolute;
        left: 0;
        width: max-content;
        background: white;
        z-index: 1;
        box-shadow: 3px 3px 10px rgba(0,0,0,0.1);
        border-radius: 6px;
    }
    .page-header .nav-list .nav-dropdown li{
        padding: 0 10px;
        font-size: 16px;
    }
    .page-header .nav-list .nav-dropdown li:hover{
        background: rgba(0,0,0,0.05);
        border-left:  solid 2px #4294E3;
    }
    .page-header .nav-list .nav-dropdown a{
        text-decoration: none;
        color: inherit;
    }
    .page-header .nav-list .nav-dropdown .active a{
        text-decoration: none;
        color: #4294E3;
    }
</style>
</html>