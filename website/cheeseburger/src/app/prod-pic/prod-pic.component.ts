import { Route } from '@angular/compiler/src/core';
import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-prod-pic',
  templateUrl: './prod-pic.component.html',
  styleUrls: ['./prod-pic.component.css']
})
export class ProdPicComponent {
  pid:string;
  constructor(private route: ActivatedRoute) {
    this.pid=this.route.snapshot.paramMap.get('id');
    // console.log(this.route.snapshot.paramMap.get('id'));
   }

  ngOnInit(): void {
  }
  
  isHovering: boolean;
  files: File[] = [];

  toggleHover(event: boolean) {
    this.isHovering = event;
  }

  onDrop(files: FileList) {
    for (let i = 0; i < files.length; i++) {
      this.files.push(files.item(i));
    }
  }
}
