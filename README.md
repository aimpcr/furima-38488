# テーブル設計

## usere テーブル

| Column           | Type   | Option      |
| ---------------- | -------| ------------|
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| fast_name        | string | null: false |
| kana_family_name | string | null: false |
| kana_fast_name   | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many : items
- has_one : buyer

## buyer テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phon_number   | string     |                                |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to : users

## items テーブル
| Columu       | Type       | Option                        |
| ------------ | ---------- | ----------------------------- |
| product_name | string     | null: false                   |
| description  | string     | null: false                   |
| category     | string     | null: false                   |
| status       | string     | null: false                   |
| price        | string     | null: false                   |
| user         | references | null: false,foreign_key: true |

### Association
- belongs_to : users
