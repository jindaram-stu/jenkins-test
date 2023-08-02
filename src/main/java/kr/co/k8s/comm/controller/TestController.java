package kr.co.k8s.comm.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping("/test")
    public String test() {
        return "햇살도 둥글둥글하게 뭉치는 맑은 날";
    }
}
