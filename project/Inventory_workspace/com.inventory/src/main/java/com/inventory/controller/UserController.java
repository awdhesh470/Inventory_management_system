package com.inventory.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.inventory.model.User;
import com.inventory.repository.UserRepository;

@RestController
public class UserController {
	
	@Autowired
	private UserRepository userRepository;
	
	
	@GetMapping("/user/{id}")
	public @ResponseBody User getUser(@PathVariable Long id){
		
		User user = userRepository.findById(id).get();
		return user;
		
	}
	
	@PostMapping("/register")
	public  ResponseEntity<?> registration(@RequestBody User user){
		
		userRepository.save(user);
		
		return new ResponseEntity<User>(user, HttpStatus.OK);	
		
	}

}
