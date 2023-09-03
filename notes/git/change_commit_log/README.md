# コミット履歴を変更する

## AuthorDate&CommitDateを変更する
### AuthorDateを変更する
`git commit --amend --date="<date-format>"`
- 日付のフォーマットは以下に準拠する
   - `RFC 2822`
   - `ISO 8601`

```sh
git commit --amend --date="2005-04-07T22:13:13"
```

### CommitDateを変更する
#### AuthorDateに揃える
`git rebase HEAD~1 --committer-date-is-author-date`

## 特定のコミットを打ち消す

### 打ち消したログを残したい

```sh
git revert <コミットID>
```

### なかったことにしたい

```sh
% git log --oneline
21e30bf (HEAD -> test) tmp3
2691636 tmp2
925c595 tmp
```

- `tmp3(21e30bf)`をなかったことにする(`tmp2(2691636)`の状態に戻す)

   ```sh
   git reset --hard 2691636
   ```

- `tmp2(2691636)`をなかったことにする
   - `git rebase`を実行すると立ち上がるエディタにて、該当コミットを削除する

      ```sh
      git rebase -i HEAD^2

      # 編集前
      pick 925c595 tmp # empty
      pick 2691636 tmp2 # empty
      pick 9db8ed2 tmp3 # empty

      # 編集後
      pick 925c595 tmp # empty
      pick 9db8ed2 tmp3 # empty

      git log --oneline
      9db8ed2 (HEAD -> test) tmp3
      925c595 tmp
      ```

      ※削除したコミット以降のコミットIDが変更されることに注意
