import {ResponseResource} from './response-resource';
import {Tour} from './tour';
import {Place} from './place';

export class Plan extends ResponseResource<Plan>{
  id: number;
  name: string;
  url: string;
  startTime: string;
  numberOfSlot: number;
  numberOfReservedSlot: number;
  adultPrice: number;
  childPrice: number;
  tour: Tour;
  places: Place[];
  placeIds: number[];
}