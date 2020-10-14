import { Component, OnInit } from '@angular/core';
import { AngularFirestore } from '@angular/fire/firestore';
import { Observable, Subject, combineLatest } from 'rxjs';
import { FirebaseService } from 'src/app/service/firebase.service';

@Component({
  selector: 'app-view',
  templateUrl: './view.component.html',
  styleUrls: ['./view.component.css']
})
export class ViewComponent implements OnInit {

  items:any;
  searchItem:string;

  constructor(
    private firebaseService: FirebaseService,
    private afs: AngularFirestore
  ) { }

  startAt = new Subject();
  endAt= new Subject();

  startobs = this.startAt.asObservable();
  endobs = this.endAt.asObservable(); 
  data;

  ngOnInit(): void {
    this.firebaseService.getUsers()
    .subscribe(result => {
      this.items = result;
    });
    combineLatest(this.startobs,this.endobs).subscribe((val) => {
      this.searchQuery(val[0],val[1]).subscribe((dataList) => {
        this.data=dataList;
      })
       
    })
  }

  search($event) {
    let query=$event.target.value;
    this.startAt.next(query);
    this.endAt.next(query + "\uf8ff");
  }

  searchQuery(start, end) {
    return this.afs.collection('product', ref => ref.limit(20).orderBy('name').startAt(start).endAt(end)).valueChanges();
  }

}
