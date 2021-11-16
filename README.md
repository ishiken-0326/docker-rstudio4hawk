# docker-rstudio4hawk
This is a container environment for developing and deploying shiny-hawk.

## 導入
1. `Dockerfile`, `docker-compose.yml`と同じ階層にshiny-hawkをcloneする
2. `docker compose up`でコンテナの作成をする
3. 作成・起動したコンテナのrsutdioでshiny-hawkのセットアップと同様の作業をする
   1. プロジェクトに移動, `source('development.r')`