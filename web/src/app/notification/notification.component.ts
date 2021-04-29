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
  fakeArray=new Array(5)
  constructor() {}
  ngOnInit(): void {
  }
  clearArray(){
    this.fakeArray=null
  }
}
