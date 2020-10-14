import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { FirebaseService } from 'src/app/service/firebase.service';

@Component({
  selector: 'app-create',
  templateUrl: './create.component.html',
  styleUrls: ['./create.component.css']
})
export class CreateComponent implements OnInit {

  options: FormGroup;

  constructor(
    fb: FormBuilder,
    private firebaseService: FirebaseService,
    private router: Router
    ) { 
      this.options = fb.group({
        name: 'string',
        surname: '',
        age: 0
      });
    }

  ngOnInit(): void {
  }
  onSubmit(value){
    this.firebaseService.createUser(value)
    .then(
      res => {
        // this.resetFields();
        this.router.navigate(['/home']);
      }
    )
  }

}
