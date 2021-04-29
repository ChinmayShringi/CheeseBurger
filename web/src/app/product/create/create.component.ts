import { Component, OnInit } from '@angular/core';
import { AngularFirestore } from '@angular/fire/firestore';
import { FormBuilder, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/service/auth.service';
import { FirebaseService } from 'src/app/service/firebase.service';

@Component({
  selector: 'app-create',
  templateUrl: './create.component.html',
  styleUrls: ['./create.component.css']
})
export class CreateComponent implements OnInit {

  options: FormGroup;
  uid:string;
  constructor(
    fb: FormBuilder,
    private firebaseService: FirebaseService,
    private router: Router,
    private db: AngularFirestore,
    public auth: AuthService,
    ) { 
      this.options = fb.group({
        name: '',
        quantity: null,
        price: null,
        uid: '',
        picid: '',
      });
    }

  ngOnInit(): void {
    this.auth.user$.subscribe(val => {
      this.uid = val.uid;
    })
  }
  onSubmit(value){
    value.uid=this.uid;
    var out = value.name.replace(/\s/g, "");
    value.picid= out;
    this.firebaseService.createUser(value)
    .then(
      res => {
        // this.resetFields();
      this.router.navigate(['/reg',out]);
      }
    )
  }

}
