export class Plan {
    constructor(
        public id: number,
        public name: string,
        public url: string,
        public startTime: number,
        public numberOfSlot: number,
        public numberOfReservedSlot: number,
        public adultPrice: number,
        public childPrice: number,
        public tourId: number
    ) {}

}