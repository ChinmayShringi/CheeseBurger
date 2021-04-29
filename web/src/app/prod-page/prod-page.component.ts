import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ProductDetail } from '../model/product.model';
import { AuthService } from '../service/auth.service';
import { FirebaseService } from '../service/firebase.service';
import { ProductService } from '../service/product.service';

@Component({
  selector: 'app-prod-page',
  templateUrl: './prod-page.component.html',
  styleUrls: ['./prod-page.component.css']
})
export class ProdPageComponent {
  prod:any; 
  uid: string;

  constructor(
    private route: ActivatedRoute,
    private service: ProductService,
    public auth: AuthService,
  ) { 
    this.prod=this.route.snapshot.queryParamMap;
  }

  ngOnInit(): void {
    this.auth.user$.subscribe(val => {
      this.uid = val.uid;
    })
  }

  add() {
    this.service.addToCart({uid:this.uid,sid:this.prod.get('uid'),name:this.prod.get('name'),quantity:this.prod.get('quantity'),price:this.prod.get('price')})
  }

}
