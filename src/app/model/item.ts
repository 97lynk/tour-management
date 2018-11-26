import {Tour} from './tour';

export class Item {
    constructor(
        public id: number,
        public tour: Tour,
        public count: number
    ) {}

}