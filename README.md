# protospace


## 作成するテーブル  
  ・users  
  ・products  
  ・thumbnails  
  ・comments  
  ・likes  

## 各テーブルのカラムと型とアソシエーション
### users

  #### users has_many products  
  #### user has_many likes  
  #### user has_many comments  

    ・name---string
    ・profile---text
    ・position---string
    ・occupation---string
    ・email---deviseを使用
    ・password---deviseを使用
    ・avatar---carriewaveを使用

### products

  #### products belongs_to user  
  #### products has_many comments  
  #### products has_many likes  
  #### products has_many thumbnails  

  ・title---string  
  ・catch_copy---string  
  ・concept---text  

### thumbnails

  #### thumbnails belongs_to products  

  ・images---enum  
  ・product_id---integer  

### likes

  #### likes belongs_to user  
  #### likes belongs_to products  

  ・user_id---integer  
  ・product_id---integer  

### comments

  #### comments belongs_to user  
  #### comments belongs_to product  

  ・text---text  
  ・user_id---integer  
  ・product_id---integer  
