import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Message } from '@my-fullstack-app/api-interfaces';

@Component({
  selector: 'my-fullstack-app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  hello$ = this.http.get<Message>('/api/hello');
  constructor(private http: HttpClient) {}
}
