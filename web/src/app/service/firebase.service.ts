import { Injectable } from '@angular/core';
import { AngularFirestore } from '@angular/fire/firestore';
import { Item } from '../model/product.model';

@Injectable({
  providedIn: 'root'
})
export class FirebaseService {

  constructor(private db: AngularFirestore) { }
  
  createUser(value){
    return this.db.collection('product').add({
      name: value.name,
      nameToSearch: value.name.toLowerCase(),
      quantity: parseInt(value.quantity),
      price: parseInt(value.price),
      uid: value.uid
    });
  }

  getUsers(){
    return this.db.collection('product').snapshotChanges();
  }
}
