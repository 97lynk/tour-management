export class Tour {

    constructor(
        public id: number,
        public name: string,
        public url: string,
        public title: string,
        public imageUrl: string,
        public content: string,
        public description: string,
        public numberOfDate: number,
        public numberOfNight: number,
        public createAt: string,
        public createBy: string) {}

}