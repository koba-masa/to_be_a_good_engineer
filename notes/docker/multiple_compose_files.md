# 複数のComposeファイルを使用する
https://docs.docker.jp/compose/extends.html

## パターン
1. 複数のファイルを併用する
1. ベースとなるファイルを拡張する
1. ベースとなるファイルを上書きする

### ベースファイル
```yml
# compose.yml
version: "3"

services:
  db1:
    image: postgres:14.6
    environment:
      POSTGRES_USERNAME: postgres
      POSTGRES_PASSWORD: postgres123
      POSTGRES_INITDB_ARGS: "-E UTF8"
      TZ: "Asia/Tokyo"
    volumes:
      - db_data:/var/lib/postgresql/data
    ports:
      - 5432:5432

volumes:
  db_data:
    external: false
```

## 複数のファイルを併用する
`docker-compose -f compose.yml -f compose2.yml up -d`

```yml
# compose2.yml
version: "3"

services:
  db2:
    image: postgres:14.6
    environment:
      POSTGRES_USERNAME: postgres
      POSTGRES_PASSWORD: postgres123
      POSTGRES_INITDB_ARGS: "-E UTF8"
      TZ: "Asia/Tokyo"
    volumes:
      - db_data2:/var/lib/postgresql/data
    ports:
      - 5433:5432

volumes:
  db_data2:
    external: false
```

```sh
% docker ps
CONTAINER ID   IMAGE           COMMAND                  CREATED          STATUS          PORTS                    NAMES
7802f8e843a5   postgres:14.6   "docker-entrypoint.s…"   44 seconds ago   Up 43 seconds   0.0.0.0:5432->5432/tcp   multiple_compose_files-db1-1
a1e1ca2e65ea   postgres:14.6   "docker-entrypoint.s…"   44 seconds ago   Up 43 seconds   0.0.0.0:5433->5432/tcp   multiple_compose_files-db2-1
```

## ベースとなるファイルを拡張する
※バージョン3系では[非サポート](https://docs.docker.jp/compose/extends.html#extends)

## ベースとなるファイルを上書きする
`docker-compose up -d`

```yml
# compose.override.yml
version: "3"

services:
  db1:
    ports:
      - 5433:5432
```

```sh
% docker ps
CONTAINER ID   IMAGE           COMMAND                  CREATED          STATUS          PORTS                                            NAMES
180ca800ff53   postgres:14.6   "docker-entrypoint.s…"   50 seconds ago   Up 49 seconds   0.0.0.0:5432->5432/tcp, 0.0.0.0:5433->5432/tcp   multiple_compose_files-db1-1
```

### 注意事項
#### ファイル名
- ファイル名は以下にすると、`docker-compose up -d`にて起動することが可能
   - `compose.override.yml`
- ベースとなる`compose.yml`を読み込んだ上で、`compose.override.yml`が読み込まれる
- 以下の実行の仕方だと、指定したファイル単体で実行することになり、エラーとなる
  - `docker-compose -f compose.override.yml up -d`
      ```sh
    % docker-compose -f compose.override.yml up -d
    service "db1" has neither an image nor a build context specified: invalid compose project
      ```

#### `-f`オプションでファイルを指定する場合
`docker-compose -f compose.yml -f compose3.yml up -d`
```yml
# compose3.yml
version: "3"

services:
  db1:
    ports:
      - 5433:5432
```

```sh
% docker ps
CONTAINER ID   IMAGE           COMMAND                  CREATED          STATUS          PORTS                                            NAMES
180ca800ff53   postgres:14.6   "docker-entrypoint.s…"   14 minutes ago   Up 13 seconds   0.0.0.0:5432->5432/tcp, 0.0.0.0:5433->5432/tcp   multiple_compose_files-db1-1
```
