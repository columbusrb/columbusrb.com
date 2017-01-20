## Columbus Ruby Brigade Website

### About

TODO: Add some information about CRB

### How to Join

TODO: Add steps on how to join

### Contributing

Local development can be done with docker and some utility scripts:

```
# Run the above docker-compose commands
script/docker-start
# Run commands in the container
script/docker-run rails c
```

View in your browser at [http://localhost:3000/](http://localhost:3000/)

Or directly with `docker-compose`:

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

