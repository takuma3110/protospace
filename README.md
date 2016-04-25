# protospace


## 作成するテーブル  
  ・users  
  ・prototypes  
  ・thumbnails  
  ・comments  
  ・likes  

## 各テーブルのカラムと型とアソシエーション
### users

  #### has_many prototypes  
  #### has_many likes  
  #### has_many comments  

    ・name---string
    ・profile---text
    ・position---string
    ・occupation---string
    ・email---deviseを使用
    ・password---deviseを使用
    ・avatar---carriewaveを使用

### prototypes

  ####  belongs_to user  
  ####  has_many comments  
  ####  has_many likes  
  ####  has_many thumbnails  

  ・title---string  
  ・catch_copy---string  
  ・concept---text  
  ・user_id---integer  

### thumbnails

  #### belongs_to prototype  

  ・status---integer
  ・product_id---integer  

### likes

  #### belongs_to user  
  #### belongs_to prototype  

  ・user_id---integer  
  ・product_id---integer  

### comments

  #### belongs_to user  
  #### belongs_to prototype  

  ・text---text  
  ・user_id---integer  
  ・product_id---integer  
