export class Booking {
    constructor(
        public id: number,
        public firstName: string,
        public lastName: string,
        public email: string,
        public phoneNumber: string,
        public bankAccount: string,
        public bookingTime: string,
        public totalOfTicket: number,
        public grandTotal: number,
        public planId: number,
        public userId: number
    ) {   }

}
