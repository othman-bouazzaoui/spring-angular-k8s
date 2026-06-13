package com.oth.api.model;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Product {
	private String name;
	private String description;
	private double price;
}
