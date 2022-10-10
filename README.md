# テーブル設計

## users テーブル

| Column             | Type   | Option                    |
| ------------------ | -------| --------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_pa​​ssword | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| kana_family_name   | string | null: false               |
| kana_first_name    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many : items
- has_many : purchases

## sending_destinations テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to : purchase

## items テーブル

| Columu             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| day_id            | integer    | null: false                    |
| price              | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- has_one : purchase

## purchases テーブル

| Columu  | Type       | Option                         |
| ------- ------------ | ------------------------------ |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association

- has_one : sending_destination
- belongs_to : item
- belongs_to : user
