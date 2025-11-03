package com.guoshengkai.doc.controller.admin;

import com.guoshengkai.doc.core.auth.NoLogin;
import com.guoshengkai.doc.core.exception.ServiceInvokeException;
import com.guoshengkai.doc.core.util.DateUtil;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("api/v2/img")
public class ImgController {

    @PostMapping("upload")
    public Map<String, String> upload(MultipartFile file) {
        String fileName = file.getOriginalFilename();
        if (null == fileName){
            fileName = file.getName();
        }
        String finalFileName = DateUtil.formatPramm("yyyy/MM/dd/") + UUID.randomUUID()
                .toString().replace("-", "") + "." + fileName.split("\\.")[1];
        File localFile = new File("images/" + finalFileName);
        if (!localFile.getParentFile().exists()){
            localFile.getParentFile().mkdirs();
        }
        try (FileOutputStream out = new FileOutputStream(localFile)) {
            out.write(file.getBytes());
        } catch (IOException e) {
            throw new ServiceInvokeException("上传失败", e);
        }
        return Map.of("code", "0", "msg", "上传成功", "url", "/api/v2/img/display/" + finalFileName);
    }

    @NoLogin
    @GetMapping("display/**")
    public void display(HttpServletRequest request, HttpServletResponse response) {
        String fileName = request.getRequestURI().split("api/v2/img/display/")[1];
        File file = new File("images/" + fileName);
        if (!file.exists()){
            throw new ServiceInvokeException("文件不存在");
        }
        try (FileInputStream in = new FileInputStream(file)){
            response.setContentType("image/png");
            response.setHeader("Content-Disposition", "inline; filename=" + fileName);
            response.setHeader("Content-Length", String.valueOf(file.length()));
            OutputStream out = response.getOutputStream();
            byte[] buffer = new byte[40960];
            int bytesRead;
            while ((bytesRead = in.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
            }
            out.flush();
        }catch (IOException e) {
            throw new ServiceInvokeException("读取文件失败", e);
        }
    }

}
