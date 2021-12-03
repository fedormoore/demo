package com.example.demo;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final AccountRepository accountRepository;

    public List<Account> getAll() {
        return accountRepository.findAll();
    }

    public List<Account> post() {
        Account account = new Account();
        account.setEmail(UUID.randomUUID().toString());
        accountRepository.save(account);
        return accountRepository.findAll();
    }
}
