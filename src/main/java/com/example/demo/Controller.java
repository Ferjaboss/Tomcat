package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {
   // return index file from resources/static folder
    @GetMapping("/")
    public String index() {
        return "Hello World";
    }
}
