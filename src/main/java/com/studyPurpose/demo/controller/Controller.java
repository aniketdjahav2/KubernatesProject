package com.studyPurpose.demo.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@RestController
public class Controller {

    @Value("${MYNAME:default-value}")
    private String name;
    @GetMapping("/")
    public ResponseEntity<String> string() {
        return ResponseEntity.status(HttpStatus.OK).body("Pushing to the private repository "+name);


    }

}
