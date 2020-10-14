import { Component, OnInit } from '@angular/core';
import { FirebaseService } from 'src/app/service/firebase.service';

@Component({
  selector: 'app-view',
  templateUrl: './view.component.html',
  styleUrls: ['./view.component.css']
})
export class ViewComponent implements OnInit {
  items:any;
  constructor(
    private firebaseService: FirebaseService,
  ) { }

  ngOnInit(): void {
    this.firebaseService.getUsers()
    .subscribe(result => {
      this.items = result;
    })
  }

}
