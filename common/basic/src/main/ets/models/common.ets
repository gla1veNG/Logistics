export interface RouterParamsModel {
  id: string
}

export interface ImageListModel {
  url: string
}

export interface BaseBuilderClass {
  title: string
  value: string
  icon?: ResourceStr
}

export interface ResponseDataModel {
  code: number,
  msg: string,
  data: string
}