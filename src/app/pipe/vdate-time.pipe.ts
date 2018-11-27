import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'vdatetime'
})
export class VDateTimePipe implements PipeTransform {

  transform(value: number | Date): string {
    let data: Date;
    if(value == null) return '';
    if(typeof value == 'number')
      data = new Date(value);
    else
      data = value;
    return data.toLocaleString('vi-VN', { hour12: true});
  }

}
