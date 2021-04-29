import { Injectable } from '@angular/core';
import { AngularFirestore } from '@angular/fire/firestore';
import { Router } from '@angular/router';
import { ProductNotifi } from '../model/user.model';

@Injectable({
  providedIn: 'root'
})
export class ProductService {

  constructor(
    private router: Router,
    private db: AngularFirestore
  ) { }

  buyNow(out) {
    this.router.navigate(['/prodProf'],{queryParams: out});
  }

  addToCart(product) {
    this.db.collection(`basket`).add(product).then(res => {
      console.log(res);
    }, err => console.log(err))
  }

  deleteOrder(data) {
    return this.db
        .collection("basket")
        .doc(data.payload.doc.id)
        .delete();
 }

 sendOrder(product: ProductNotifi) {
  this.db.collection(`orderNotifi`).add(product).then(res => {
    console.log(res);
  }, err => console.log(err))
 }
  
}
