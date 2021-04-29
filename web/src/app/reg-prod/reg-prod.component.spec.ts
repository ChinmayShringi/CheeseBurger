import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RegProdComponent } from './reg-prod.component';

describe('RegProdComponent', () => {
  let component: RegProdComponent;
  let fixture: ComponentFixture<RegProdComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RegProdComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RegProdComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
