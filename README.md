# README

## Instructions
1) `docker-compose run web rails new . --force --no-deps --database=postgresql`
2) `docker-compose build`
3) Replace contents of `/config/database.yml` with:
  ```
  default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password:
  pool: 5

  development:
    <<: *default
    database: newapp_development

  test:
    <<: *default
    database: newapp_test
  ```
4) `docker-compose build`
5) `docker-compose up`
6) `docker exec -it <container-name> bash`, then
  
    `rails db:create`
  
    (Note: Find your container name by running `docker ps -a`)