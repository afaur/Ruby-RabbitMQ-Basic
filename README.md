# Description
Tool for quickly connecting to rabbit and getting messages.

# Getting Started
Add the following into a file at: `config/settings.yml`
```
settings:
  - :username: ''
    :password: ''
    :vhost: ''
    :port: 5672
    :host: ''
    :queue: ''
```
- Fill in the values with your settings.

# Running
```
> bundle install
> bundle exec rake
```
