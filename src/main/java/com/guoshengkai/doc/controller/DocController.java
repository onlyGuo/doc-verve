package com.guoshengkai.doc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("doc")
public class DocController {

    @RequestMapping
    public String docHome(Model model){
        return docHome1(model);
    }
    @RequestMapping("/")
    public String docHome1(Model model){
        String title = "文档";
        return "doc/index";
    }
}
