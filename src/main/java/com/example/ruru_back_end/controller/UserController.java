package com.example.ruru_back_end.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/users")
public class UserController {

    @GetMapping("")
    private String greetings(@RequestParam String name) {

        String result;
        result = "Hello hey " + name;
        return result;

    }

}
