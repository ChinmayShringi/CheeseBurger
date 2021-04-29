export interface User {
  uid: string;
  email: string;
  photoURL?: string;
  displayName?: string;
  myCustomData?: string;
}
export interface Product {
  uid: string;
  pid: string;
  price: number;
  quantity: number;
}

export interface ProductNotifi {
  bid: string;
  sid: string;
  pid:string;
}