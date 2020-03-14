import { Injectable } from '@nestjs/common';
import { Message } from '@my-fullstack-app/api-interfaces';

@Injectable()
export class AppService {
  getData(): Message {
    return { message: 'Welcome from api!' };
  }
}
