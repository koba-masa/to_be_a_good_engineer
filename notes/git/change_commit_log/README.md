# コミット履歴を変更する

## AuthorDateを変更する
`git commit --amend --date="<date-format>"`
- 日付のフォーマットは以下に準拠する
   - `RFC 2822`
   - `ISO 8601`

```sh
git commit --amend --date="2005-04-07T22:13:13"
```
