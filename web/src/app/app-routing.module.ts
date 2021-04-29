import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from './auth.guard';
import { AuthgaurdGuard } from './authgaurd.guard';
import { CartComponent } from './cart/cart.component';
import { ChatComponent } from './chat/chat.component';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';
import { NotificationComponent } from './notification/notification.component';
import { ProdPageComponent } from './prod-page/prod-page.component';
import { ProdPicComponent } from './prod-pic/prod-pic.component';
import { CreateComponent } from './product/create/create.component';
import { EditComponent } from './product/edit/edit.component';
import { ViewComponent } from './product/view/view.component';
import { UserprofileComponent } from './userprofile/userprofile.component';


const routes: Routes = [
  { path: '',component: HomeComponent },
  { path: 'home',component: HomeComponent },
  { path: 'userProf', component: UserprofileComponent,  canActivate: [AuthGuard] },
  { path: 'login',component: LoginComponent },
  { path: 'reg/:id',component: ProdPicComponent },
  { path: 'vprod',component: ViewComponent },
  { path: 'cprod',component: CreateComponent ,canActivate: [AuthGuard]},
  { path: 'uprod',component: EditComponent },
  { path: 'cart',component: CartComponent },
  { path: 'chat',component: ChatComponent ,canActivate: [AuthGuard]},
  { path: 'notifi',component: NotificationComponent },
  { path: 'prodProf',component: ProdPageComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
