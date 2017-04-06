# Database specifications

---

## users table

| Column | Type | Options |
|:-----------|:-------|:-----------|
| name | string | index: true, null: false, unique: true |

### Association

- has_many :groups, through: members
- has_maby :messages
- has_many :members

### Use gem 'devise'

---

## groups table

| Column | Type | Options |
|:-----------|:-------|:-----------|
| name | string | null: false, unique: true |

### Association

- has_many :users, through: members
- has_many :messages
- has_many :members

---

## members table

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
