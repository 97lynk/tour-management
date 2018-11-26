import {ResponseResource} from './response-resource';

export class Tour extends ResponseResource<Tour> {
  id: number;
  name: string;
  url: string;
  imageUrl: string;
  fileContentUrl: string;
  description: string;
  numberOfDate: number;
  numberOfNight: number;
  createAt: string;
  createBy: string;
}
