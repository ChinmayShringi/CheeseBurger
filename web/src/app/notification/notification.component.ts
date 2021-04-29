import { Component, OnInit } from '@angular/core';
import { AngularFirestore } from '@angular/fire/firestore';
import { combineLatest, Subject } from 'rxjs';
import { AuthService } from '../service/auth.service';
import { FirebaseService } from '../service/firebase.service';
import { ProductService } from '../service/product.service';

@Component({
  selector: 'app-notification',
  templateUrl: './notification.component.html',
  styleUrls: ['./notification.component.css']
})
export class NotificationComponent implements OnInit {
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
    return this.afs.collection('orderNotifi', ref => ref.limit(5).orderBy('sid').startAt(start).endAt(end)).snapshotChanges();
    // return this.afs.collection('collectionName').doc(id).valueChanges()
    // will call the data by its id
  }

  deleteOrder(data) {
    this.ps.deleteOrder(data);
  }

}
