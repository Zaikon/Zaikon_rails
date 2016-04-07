# Structure of DataBase

## User
### model-association

```
has_many :categories
```

### table

- email
- password

## Category
### association

```
has_many :goods,
belongs_to :user
```

### table

- name
- user_id


## Good
### association

```
belongs_to :category
```

### table

- name
- stock_num
- notification_num
- image
- amazon_url
- category_id
- counting_type
