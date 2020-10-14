import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProdPicComponent } from './prod-pic.component';

describe('ProdPicComponent', () => {
  let component: ProdPicComponent;
  let fixture: ComponentFixture<ProdPicComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProdPicComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProdPicComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
