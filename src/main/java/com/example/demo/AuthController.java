package com.example.demo;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin(origins = {"*"})
@RestController
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;

    @GetMapping("/get")
    public List<Account> getAll() {
        return authService.getAll();
    }

    @GetMapping("/post")
    public List<Account> post() {
        return authService.post();
    }

}
