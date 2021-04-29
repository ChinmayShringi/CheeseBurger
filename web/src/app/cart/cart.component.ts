import { Component, OnInit } from '@angular/core';
import { AngularFirestore } from '@angular/fire/firestore';
import { combineLatest, Subject } from 'rxjs';
import { map } from 'rxjs/operators';
import { AuthService } from '../service/auth.service';
import { FirebaseService } from '../service/firebase.service';
import { ProductService } from '../service/product.service';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent implements OnInit {
  items:any;
  searchItem:string;
  isavailable:boolean;

  constructor(
    private firebaseService: FirebaseService,
    private afs: AngularFirestore,
    private auth: AuthService,
    private ps: ProductService
  ) {
   }

  startAt = new Subject();
  endAt= new Subject();

  startobs = this.startAt.asObservable();
  endobs = this.endAt.asObservable(); 
  data;
  uid:string;
  total:number;

  ngOnInit(): void {
    this.auth.user$.subscribe(val => {
      this.uid=val.uid;
      this.search(this.uid)
    })
    combineLatest(this.startobs,this.endobs).subscribe((val) => {
      this.searchQuery(val[0],val[1]).subscribe((dataList) => {
        this.data=dataList;
      })
    })
  }

  search(query) {
    this.startAt.next(query);
    this.endAt.next(query + "\uf8ff");
  }

  searchQuery(start, end) {
    return this.afs.collection('basket', ref => ref.limit(5).orderBy('uid').startAt(start).endAt(end)).snapshotChanges();
  }

  deleteOrder(data) {
    this.ps.deleteOrder(data);
  }

  sendOrder() {
    this.data.forEach(element => {
      this.ps.sendOrder({bid:this.uid,sid:element.payload.doc.data().sid,pid:element.payload.doc.id})
    });
    
  }

}
