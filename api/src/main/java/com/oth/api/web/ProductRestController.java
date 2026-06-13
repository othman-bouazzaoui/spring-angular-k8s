package com.oth.api.web;

import com.oth.api.model.Product;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/products")
public class ProductRestController {

	@RequestMapping
	public ResponseEntity<List<Product>> getProducts() {
		return ResponseEntity.ok(List.of(//
				Product.builder().name("Laptop").description("A high-performance laptop for work and gaming.").price(999.99).build(),//
				Product.builder().name("Smartphone").description("A sleek smartphone with a powerful camera.").price(699.99).build(),//
				Product.builder().name("Headphones").description("Noise-cancelling headphones for immersive sound.").price(199.99).build()//
		));
	}

}
