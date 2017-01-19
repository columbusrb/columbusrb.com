## Columbus Ruby Brigade Website

### About

TODO: Add some information about CRB

### How to Join

TODO: Add steps on how to join

### Contributing

To start the app and database, you can use the helper script:

```
script/docker-start
```

Once that is up and running, you can execute `rake` and `rails` commands (or anything else) via `script/docker-run`, e.g.:

```
script/docker-run rails console
```

or

```
script/docker-run rake -T
```

View in your browser at [http://localhost:3000/](http://localhost:3000/)

You can also use docker-compose directly:

```
docker-compose build
docker-compose up -d postgres
docker-compose run --rm app rake db:setup
docker-compose up -d app
docker-compose logs -f
```

To run commands in the context of the container, e.g., `rails console`:

```
docker-compose run --rm app rails console
```
