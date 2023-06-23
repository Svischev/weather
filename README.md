# README

База: postgresql
Есть реализация seed для создания пользователей и городов.

'''
bundle
rails db:create
rails db:migrate
rails db:seed
'''

Использовал:
bootstrap - чтобы все выглядело более-менее вменяемо
devise - для аутентификации
pundit - для авторизации на админку городов (cancancan тоже использовал ранее)
dotenv-rails - для переменных окружения, куда добавлял приватные ключи (API погоды, Яндекс карты)
faraday - для получения данных из внешнего API
pry - для дебага
redis-store - кеширование в редис
rubocop-rails - для помощи в code style

Систему роли сделал как bool поле 'admin' на User.
В случае наличия множества ролей можно использовать rolify (работал с ним).

Поиск погоды реализован в Weather::SearchService
('/app/services/weather/search_service.rb')

Для работы с API реализован отдельный клиент Api::Openweathermap
С обработкой ошибок в главном классе Api::Client
('/lib/api/openweathermap.rb')

Для получения погоды использовал бесплатный сервис openweathermap
https://openweathermap.org

Для динамического отображения на карте использовал Яндекс JavaScript API
https://yandex.ru/dev/maps/jsapi

Мини админка реализована в зоне модулей Admin
(можно использовать гемы rails_admin или activeadmin)

Для тестов: rspec с фабриками, фейкером и стабом внешних запросов
('/spec/services/weather/search_service_spec.rb')
