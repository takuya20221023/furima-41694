# テーブル設計

## users テーブル

ユーザーの情報を管理するテーブル

| Column            | Type   | Options                        |
|------------------|--------|--------------------------------|
| nickname        | string | null: false                   |
| email           | string | null: false, unique: true     |
| encrypted_password | string | null: false                   |
| last_name       | string | null: false                   |
| first_name      | string | null: false                   |
| last_name_kana  | string | null: false                   |
| first_name_kana | string | null: false                   |
| birth_date      | date   | null: false                   |

### Association
- has_many :items
- has_many :orders

---

## items テーブル

出品された商品の情報を管理するテーブル

| Column          | Type       | Options                        |
|----------------|------------|--------------------------------|
| image         | string     | null: false                   |
| name          | string     | null: false                   |
| description   | text       | null: false                   |
| price         | integer    | null: false                   |
| user          | references | null: false, foreign_key: true |
| category_id   | integer    | null: false                   |
| condition_id  | integer    | null: false                   |
| shipping_fee_id | integer  | null: false                   |
| shipping_from_id | integer  | null: false                   |
| shipping_days_id | integer | null: false                   |

### Association
- belongs_to :user
- has_one :order

---

## orders テーブル

購入履歴を管理するテーブル

| Column  | Type       | Options                        |
|---------|-----------|--------------------------------|
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

---

## addresses テーブル

購入された商品の配送先情報を管理するテーブル

| Column        | Type       | Options                        |
|--------------|------------|--------------------------------|
| order        | references | null: false, foreign_key: true, unique: true |
| postal_code  | string     | null: false                   |
| prefecture_id | integer   | null: false                   |
| city         | string     | null: false                   |
| address      | string     | null: false                   |
| building     | string     |                                |
| phone_number | string     | null: false                   |

### Association
- belongs_to :order


