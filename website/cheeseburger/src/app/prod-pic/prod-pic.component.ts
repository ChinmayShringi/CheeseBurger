import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-prod-pic',
  templateUrl: './prod-pic.component.html',
  styleUrls: ['./prod-pic.component.css']
})
export class ProdPicComponent implements OnInit {

  constructor() { }

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
