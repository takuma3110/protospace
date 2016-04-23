# protospace


##作成するテーブル  
  ・users  
  ・products  
  ・sub_thumbnails  
  ・comments  
  ・likes  

##各テーブルのカラムと型
###users
    ・name---string
    ・profile---text
    ・position---string
    ・occupation---string
    ・email---deviseを使用
    ・password---deviseを使用
    ・image---paperclipを使用
    
###products
  ・title---string  
  ・main_thumbnail---paperclipを使用  
  ・catch_copy---string  
  ・concept---text  

###sub_thumbnails
  ・image---paperclipを使用  
  ・product_id---integer  
  
###likes
  ・user_id---integer  
  ・product_id---integer  

###comments
  ・comment---text  
  ・user_id---integer  
  ・product_id---integer  
  

##アソシエーション
  users has_many products  
  user has_many likes  
  user has_many comments  

  products belongs_to user  
  products has_many comments  
  products has_many likes  
  products has_many sub_thumbnails  

  comments belongs_to user  
  comments belongs_to product  

  likes belongs_to user  
  likes belongs_to products  

  sub_thumbnails belongs_to products  

  sub_thumbnails belongs_to products  
