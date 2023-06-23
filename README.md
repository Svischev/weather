# README

rails 7.0.5
ruby 3.1.2

**База: postgresql**

Есть реализация seed для создания пользователей и городов.  

```
bundle
rails db:create
rails db:migrate
rails db:seed
```

**Тесты и rubocop**

```
rspec
rubocop
```

**Использовал**:

bootstrap - чтобы все выглядело более-менее вменяемо  
devise - для аутентификации  
pundit - для авторизации на админку городов (cancancan тоже использовал ранее)  
dotenv-rails - для переменных окружения, куда добавлял приватные ключи (API погоды, Яндекс карты)  
faraday - для получения данных из внешнего API (так же есть опыт `rest-client` и `httparty`)  
pry - для дебага  
redis-store - кеширование в редис  
rubocop-rails - для помощи в code style  

**Описание реализации**:  

Систему роли сделал как bool поле `admin` на User.  
В случае наличия множества ролей можно использовать rolify (работал с ним).  

Поиск погоды реализован в Weather::SearchService  
(`/app/services/weather/search_service.rb`)  

Для работы с API реализован отдельный клиент Api::Openweathermap  
С обработкой ошибок в главном классе Api::Client  
(`/lib/api/openweathermap.rb`)  

Для получения погоды использовал бесплатный сервис openweathermap  
https://openweathermap.org  

Для динамического отображения на карте использовал Яндекс JavaScript API  
https://yandex.ru/dev/maps/jsapi  

Мини админка реализована в зоне модулей Admin  
(можно использовать гемы rails_admin или activeadmin)  

Для тестов: rspec с фабриками, фейкером и стабом внешних запросов  
(`/spec/services/weather/search_service_spec.rb`)  

**Ключи**
```
OWM_APPID=6e8fedc7ee0e89d13cbc0a0499972abc
YANDEX_API_KEY=d9b326b3-beeb-499d-9ecb-938c75c7af75
```

**Скрины:**

<img width="890" alt="Снимок экрана 2023-06-23 в 12 06 50" src="https://github.com/Svischev/weather/assets/7647253/a56b39aa-ab92-4ea9-b014-ea58d3c2763e">  
<img width="1163" alt="Снимок экрана 2023-06-23 в 12 08 49" src="https://github.com/Svischev/weather/assets/7647253/7e6d2972-4444-49c8-9ae7-ed696f332bf5">  


