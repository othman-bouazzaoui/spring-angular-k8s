import { Component, inject, OnInit } from '@angular/core';
import { ProductService } from '../product.service';

@Component({
  selector: 'app-content',
  templateUrl: './content.component.html',
  styleUrl: './content.component.scss'
})
export class ContentComponent implements OnInit{


  products: Product[] = [];

  ngOnInit(): void {
    //this.getAllProducts();
  }

  productService: ProductService = inject(ProductService);

  getAllProducts(): void {
    this.productService.getAllProducts().subscribe(products => {
      this.products = products;
    })
  } 

}

interface Product {
  name?: string;
  description?: string;
  price?: number;
}
