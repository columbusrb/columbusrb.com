## Columbus Ruby Brigade Website

### About

TODO: Add some information about CRB

### How to Join

TODO: Add steps on how to join

### Contributing

With docker-compose:

```
docker-compose build
docker-compose create
docker-compose start postgres
docker-compose run --rm app bundle exec rake db:setup
docker-compose start app
```

To run commands in the context of the container, e.g., `rake -T`:

```
docker-compose run --rm app rake -T
```

Some utility scripts have been added:

```
# Run the above docker-compose commands
script/docker-start
# Run commands in the container
script/docker-run rails c
```
