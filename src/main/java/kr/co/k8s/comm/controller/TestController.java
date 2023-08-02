package kr.co.k8s.comm.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping("/test")
    public String test() {
        return "햇살도 둥글둥글하게 뭉치는 맑은 날";
    }

    @GetMapping("/test2")
    public String test2() {
        return "동해물과 백두산이 마르고 닳도록";
    }

    @GetMapping("/test3")
    public String test3() {
        return "하느님이 보우하사 우리나라 만세";
    }

}
