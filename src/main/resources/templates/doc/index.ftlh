<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>{{主标题}} - AI图书馆</title>
</head>
<body>
<div class="page-header">
    <div class="page-header-content">
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
</div>
<div class="page-content">
    <div class="left-nav">
        <div class="left-nav-title">
            章节目录
            <div class="left-nav-title-subtitle">介绍内容介绍内容介绍内容介绍内容介绍内容</div>
        </div>
        <div class="left-nav-list-scroll">
            <div class="left-nav-scroll-y-bar">
                <div class="left-nav-scroll-y-thumb"></div>
            </div>
            <div class="left-nav-list">
                <a class="left-nav-list-item active">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a><a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a><a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a><a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a><a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a><a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a><a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a><a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a><a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a><a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a><a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a><a class="left-nav-list-item">
                    章节1111
                </a><a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a><a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a><a class="left-nav-list-item">
                    章节1111
                </a><a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a><a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a>
                <a class="left-nav-list-item">
                    章节1111
                </a>
            </div>
        </div>
    </div>
    <div class="content">
        <div class="scroll-y-bar">
            <div class="scroll-y-thumb"></div>
        </div>
        <div style="padding: 40px;" class="scroll-content">
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
                <div class="before">
                    上一篇 <a href="javascript:void(0);">《惺惺惜惺惺》</a>
                </div>
                <div class="after">
                    下一篇 <a href="javascript:void(0);">《惺惺惜惺惺》</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" >
    const scrollContent = document.getElementsByClassName("scroll-content")[0];
    const scrollYBar = document.getElementsByClassName("scroll-y-bar")[0];
    const scrollYThumb = document.getElementsByClassName("scroll-y-thumb")[0];

    const leftNavScroll = document.getElementsByClassName("left-nav-list")[0];
    const leftNavScrollYBar = document.getElementsByClassName("left-nav-scroll-y-bar")[0];
    const leftNavScrollYThumb = document.getElementsByClassName("left-nav-scroll-y-thumb")[0];

    document.onresize = function () {
        const scrollContentHeight = scrollContent.scrollHeight;
        const scrollContentClientHeight = scrollContent.clientHeight;
        const scrollYBarHeight = scrollYBar.clientHeight;
        const scrollYThumbHeight = Math.max(scrollYBarHeight * (scrollContentClientHeight / scrollContentHeight), 50);
        scrollYThumb.style.height = scrollYThumbHeight + 'px';

        const leftNavScrollHeight = leftNavScroll.scrollHeight;
        const leftNavScrollClientHeight = leftNavScroll.clientHeight;
        const leftNavScrollYBarHeight = leftNavScrollYBar.clientHeight;
        const leftNavScrollYThumbHeight = Math.max(leftNavScrollYBarHeight * (leftNavScrollClientHeight / leftNavScrollHeight), 50);
        leftNavScrollYThumb.style.height = leftNavScrollYThumbHeight + 'px';
    }
    document.addEventListener("DOMContentLoaded", function () {
        document.onresize();
    });
    let lastScrollTime = 0;
    scrollContent.onscroll = function () {
        const scrollTop = scrollContent.scrollTop;
        const scrollContentHeight = scrollContent.scrollHeight;
        const scrollContentClientHeight = scrollContent.clientHeight;
        const scrollYBarHeight = scrollYBar.clientHeight;
        const scrollYThumbHeight = Math.max(scrollYBarHeight * (scrollContentClientHeight / scrollContentHeight), 50);
        const scrollYThumbTop = (scrollTop / (scrollContentHeight - scrollContentClientHeight)) * (scrollYBarHeight - scrollYThumbHeight);
        scrollYThumb.style.top = scrollYThumbTop + 'px';
        lastScrollTime = Date.now();
        scrollYBar.classList.add("scrolling");
        setTimeout(function () {
            if (Date.now() - lastScrollTime > 800) {
                scrollYBar.classList.remove("scrolling");
            }
        }, 1000);
    }
    leftNavScroll.onscroll = function () {
        const scrollTop = leftNavScroll.scrollTop;
        const scrollContentHeight = leftNavScroll.scrollHeight;
        const scrollContentClientHeight = leftNavScroll.clientHeight;
        const scrollYBarHeight = leftNavScrollYBar.clientHeight;
        const scrollYThumbHeight = Math.max(scrollYBarHeight * (scrollContentClientHeight / scrollContentHeight), 50);
        const scrollYThumbTop = (scrollTop / (scrollContentHeight - scrollContentClientHeight)) * (scrollYBarHeight - scrollYThumbHeight);
        leftNavScrollYThumb.style.top = scrollYThumbTop + 'px';
        lastScrollTime = Date.now();
        setTimeout(function () {
            if (Date.now() - lastScrollTime > 800) {
                leftNavScrollYBar.classList.remove("scrolling");
            }
        }, 1000);
    }
    scrollYThumb.onmousedown = function (e) {
        e.preventDefault();
        const scrollYBarHeight = scrollYBar.clientHeight;
        const scrollYThumbHeight = scrollYThumb.clientHeight;
        const scrollContentHeight = scrollContent.scrollHeight;
        const scrollContentClientHeight = scrollContent.clientHeight;
        const maxScrollTop = scrollContentHeight - scrollContentClientHeight;
        let startY = e.clientY - scrollYThumb.offsetTop;
        document.onmousemove = function (e) {
            let top = e.clientY - startY - scrollYBar.offsetTop;
            top = Math.max(0, Math.min(top, scrollYBarHeight - scrollYThumbHeight));
            const scrollTop = top / (scrollYBarHeight - scrollYThumbHeight) * maxScrollTop;
            scrollContent.scrollTop = scrollTop;
            return false;
        }
    }
    leftNavScrollYThumb.onmousedown = function (e) {
        e.preventDefault();
        const leftNavScrollYBarHeight = leftNavScrollYBar.clientHeight;
        const leftNavScrollYThumbHeight = leftNavScrollYThumb.clientHeight;
        const leftNavScrollHeight = leftNavScroll.scrollHeight;
        const leftNavScrollClientHeight = leftNavScroll.clientHeight;
        const maxScrollTop = leftNavScrollHeight - leftNavScrollClientHeight;
        let startY = e.clientY - leftNavScrollYThumb.offsetTop;
        document.onmousemove = function (e) {
            let top = e.clientY - startY - leftNavScrollYBar.offsetTop;
            top = Math.max(0, Math.min(top, leftNavScrollYBarHeight - leftNavScrollYThumbHeight));
            const scrollTop = top / (leftNavScrollYBarHeight - leftNavScrollYThumbHeight) * maxScrollTop;
            leftNavScroll.scrollTop = scrollTop;
            return false;
        }
    }
    document.onmousemove = function (e) {
        e.preventDefault();
    }
    document.onmouseup = function () {
        document.onmousemove = null;
    }
</script>
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
    .page-header{
        /*padding: 10px;*/
        border-bottom: 1px solid #ddd;

    }
    .page-header-content{
        display: flex;
        justify-content: space-between;
        max-width: 1400px;
        margin: 0 auto;
    }
    .page-header .logo{
        font-size: 30px;
        font-weight: bold;
        text-decoration: none;
        line-height: 57px;
        margin-left: 20px;
    }
    .page-header .nav-list{
        display: flex;
        justify-content: space-between;
        list-style-type: none;
        margin: 0;
        padding: 0;
        font-size: 20px;
        line-height: 55px;
    }
    .page-header .nav-list a{
        text-decoration: none;
        color: inherit;
    }
    .page-header .nav-list li{
        position: relative;
        padding: 0 10px;
        font-size: 16px;
        transition: all 0.3s;
    }
    .page-header .nav-list li.active{
        border-bottom: solid 2px #4294E3;
    }
    .page-header .nav-list li:hover a{
        color: #4294E3;
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
        display: none;
        transition: all 0.3s;
    }
    .page-header .nav-list li:hover .nav-dropdown{
        display: block;
    }
    .page-header .nav-list .nav-dropdown li{
        padding: 0 10px;
        font-size: 16px;
        /*border-left:  solid 2px transparent;*/
        background: rgba(0,0,0,0);
        transition: all 0.3s;
        border-bottom: 0;
        line-height: 40px;
    }
    .page-header .nav-list .nav-dropdown li:hover{
        background: rgba(0,0,0,0.05);
        /*border-left:  solid 2px #4294E3;*/
    }
    .page-header .nav-list li:hover .nav-dropdown a{
        text-decoration: none;
        color: inherit;
    }
    .page-header .nav-list li:hover .nav-dropdown .active a{
        text-decoration: none;
        color: #4294E3;
    }
    .page-header .nav-list .nav-dropdown .active a{
        text-decoration: none;
        color: #4294E3;
    }

    .page-content{
        max-width: 1400px;
        margin: 0 auto;
        display: flex;
    }
    .left-nav{
        width: 250px;
        border-right: 1px solid #ddd;
        height: calc(100vh - 58px);
        display: flex;
        flex-direction: column;
        overflow: hidden;
    }
    .left-nav-title{
        line-height: 40px;
        font-size: 18px;
        font-weight: bold;
        border-bottom: 1px solid #ddd;
        margin-right: 20px;
        color: #213547;
    }
    .left-nav-title-subtitle{
        font-size: 14px;
        color: #999;
        line-height: 20px;
        font-weight: normal;
        margin-bottom: 10px;
    }
    .left-nav-list{
        flex: 1;
        overflow-y: auto;
        padding-top: 10px;
        padding-bottom: 10px;
        padding-right: 10px;
        height: calc(100% - 20px);
    }
    .left-nav-list::-webkit-scrollbar{
        width: 0;
        background-color: rgba(0,0,0,0.05);
    }
    .left-nav-list-item{
        display: block;
        line-height: 35px;
        font-size: 16px;
        color: #999;
        text-decoration: none;
        padding: 0 10px;
        border-radius: 4px;
        transition: all 0.3s;
        background: rgba(0,0,0,0);
        border-left:  solid 2px transparent;
        cursor: pointer;
    }
    .left-nav-list-item:hover{
        background: rgba(0,0,0,0.05);
    }
    .left-nav-list-item.active{
        background: rgba(0,0,0,0.05);
        border-left:  solid 2px #4294E3;
    }

    .left-nav-list-scroll{
        position: relative;
        flex: 1;
        overflow: hidden;
    }
    .left-nav-list-scroll::-webkit-scrollbar{
        width: 0;
        background-color: rgba(0,0,0,0.05);
    }
    .left-nav-scroll-y-bar{
        position: absolute;
        top: 0;
        right: 0;
        width: 10px;
        /*height: calc(100vh - 58px);*/
        height: 100%;
        background-color: rgba(0,0,0,0);
        border-radius: 5px;
        opacity: 0;
        transition: all .3s;
    }
    .left-nav-scroll-y-bar.scrolling{
        opacity: 1;
    }
    .left-nav-scroll-y-bar:hover{
        opacity: 1;
        background-color: rgba(0,0,0,0.05);
    }
    .left-nav-scroll-y-bar .left-nav-scroll-y-thumb{
        position: absolute;
        top: 0;
        right: 0;
        width: 10px;
        height: 50px;
        background-color: rgba(0,0,0,0.15);
        border-radius: 5px;
        transition: background-color .3s;
        cursor: pointer;
    }
    .left-nav-scroll-y-bar .left-nav-scroll-y-thumb:hover{
        background-color: rgba(0,0,0,0.3);
    }



    .scroll-content{
        overflow-y: auto;
        height: calc(100% - 80px);
    }

    .scroll-content::-webkit-scrollbar{
        width: 0;
        background-color: rgba(0,0,0,0.05);
    }

    .scroll-y-bar{
        position: absolute;
        top: 0;
        right: 0;
        width: 10px;
        /*height: calc(100vh - 58px);*/
        height: 100%;
        background-color: rgba(0,0,0,0);
        border-radius: 5px;
        opacity: 0;
        transition: all .3s;
    }
    .scroll-y-bar.scrolling{
        opacity: 1;
    }

    .scroll-y-bar:hover{
        opacity: 1;
        background-color: rgba(0,0,0,0.05);
    }
    .scroll-y-bar .scroll-y-thumb{
        position: absolute;
        top: 0;
        right: 0;
        width: 10px;
        height: 50px;
        background-color: rgba(0,0,0,0.15);
        border-radius: 5px;
        transition: background-color .3s;
        cursor: pointer;
    }
    .scroll-y-bar .scroll-y-thumb:hover{
        background-color: rgba(0,0,0,0.3);
    }


    .content{
        height: calc(100vh - 58px);
        position: relative;
        flex: 1;
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
    .content-content img{
        max-width: 100%;
    }
    .content-content h1,h2,h3{
        font-weight: bold;
        margin-bottom: 10px;
        margin-top: 15px;
    }
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
    }



</style>
</html>
