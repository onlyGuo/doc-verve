package com.guoshengkai.doc.controller.admin;

import com.guoshengkai.doc.entitys.Classify;
import com.guoshengkai.doc.service.ClassifyService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/v2/classify")
public class AdminClassifyController {

    @Resource
    private ClassifyService classifyService;

    @GetMapping
    public List<Classify> listClassify() {
        return classifyService.listClassify();
    }

    @PostMapping
    public Classify newClassify(@RequestBody Classify classify) {
        return classifyService.createClassify(classify);
    }

}
