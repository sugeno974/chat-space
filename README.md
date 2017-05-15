# Database specifications

---

## users table

| Column | Type | Options |
|:-----------|:-------|:-----------|
| name | string | index: true, null: false, unique: true |

### Association

- has_many :groups, through: group_users
- has_many :messages
- has_many :group_users

### Use gem 'devise'

---

## groups table

| Column | Type | Options |
|:-----------|:-------|:-----------|
| name | string | null: false, unique: true |

### Association

- has_many :users, through: group_users
- has_many :messages
- has_many :group_users

---

## group_users table

| Column | Type | Options |
|:-----------|:-------|:-----------|
| group_id | references | foreign_key: true |
| user_id | references | foreign_key: true |

### Association

- belongs_to :group
- belongs_to :user

---

## messages table

| Column | Type | Options |
|:-----------|:-------|:-----------|
| body | text |  |
| image | string |  |
| group_id | references | foreign_key: true |
| user_id | references | foreign_key: true |

### Association

- belongs_to :group
- belongs_to :user
