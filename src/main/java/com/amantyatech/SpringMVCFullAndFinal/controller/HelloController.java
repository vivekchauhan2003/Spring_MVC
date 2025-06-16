package com.amantyatech.SpringMVCFullAndFinal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {

    @ModelAttribute("course")
    public String courseName(){
        return "Java Full Stack";
    }

    @GetMapping("/home")
    public String home(){
        return "index1";
    }

    @RequestMapping("addAlien")
    public String addAlien(@ModelAttribute Alien alien) {
        return "result1";
    }


}


































