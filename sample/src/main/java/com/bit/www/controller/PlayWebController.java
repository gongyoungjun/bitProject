package com.bit.www.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
@Slf4j
public class PlayWebController {

    @GetMapping("/play/profile")
    public String profile(){
        return "play/profile";
    }
    @GetMapping("/play/search")
    public String search(){
        return "play/search";
    }
    @GetMapping("/play/signup")
    public String signup(){
        return "play/signup";
    }

}
