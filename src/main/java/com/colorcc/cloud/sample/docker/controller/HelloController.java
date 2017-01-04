package com.colorcc.cloud.sample.docker.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/hello")
public class HelloController {

	@GetMapping("/say")
	public String say(@RequestParam(name = "name", required = false) String name) {
		if (name == null || name.trim().length() == 0) {
			name = "world";
		}

		return "Hello [ auto ]" + name + ".\n";
	}
}
