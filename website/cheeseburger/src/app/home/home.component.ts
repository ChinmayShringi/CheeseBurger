import { Component, OnInit } from '@angular/core';
import { FirebaseService } from '../service/firebase.service';
import { ProductService } from '../service/product.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  items:any;
  constructor(
    private firebaseService: FirebaseService,
    public bn: ProductService
  ) { }

  ngOnInit(): void {
    this.firebaseService.getUsers()
    .subscribe(result => {
      this.items = result;
    });
  }
  

}
