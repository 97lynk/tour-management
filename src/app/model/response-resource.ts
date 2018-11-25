export class ResponseResource<T> {

  links: Link[];

  content: T[]; // for response data with array

  page: Page;
}

export class Link {
  rel: string;
  href: string;
  hreflang: string;
  media: string;
  title: string;
  type: string;
  deprecation: string;
}

export class Page {
  size: number;
  totalElements: number;
  totalPages: number;
  number: number;
}
