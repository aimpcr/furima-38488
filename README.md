# テーブル設計

## usere テーブル

| Column             | Type   | Option                    |
| ------------------ | -------| --------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_pa​​ssword | string | null: false               |
| family_name        | string | null: false               |
| fast_name          | string | null: false               |
| kana_family_name   | string | null: false               |
| kana_fast_name     | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many : items
- has_many : purchases

## sendiing_destunations テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to : purchase

## items テーブル

| Columu             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| description        | string     | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| days_id            | integer    | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- has_one : purchase

## purchases テーブル

| Columu  | Type       | Option                         |
| ------- ------------ | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- has_one : sendiing_destunation
- belongs_to : items
