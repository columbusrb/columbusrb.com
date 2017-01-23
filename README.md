## Columbus Ruby Brigade Website

### About

TODO: Add some information about CRB

### How to Join

TODO: Add steps on how to join

### Contributing

To start the development server, run the following scripts:

```
script/setup
script/server
```

After the initial setup you should only need to run `script/server`.

View in your browser at [http://localhost:3000/](http://localhost:3000/)

A breakdown of the various scripts:

```
script/setup   # Pull down and setup support images (postgres).
script/server  # Start the development server.
script/run     # Execute arbitrary commands in the web container.  E.g., 
               #   script/run bin/rails runner 'puts BoardMember.count'
script/test    # Run "rake" in the web container.
script/console # Run "rails console" in the web container.
script/cleanup # Remove the development containers.
```
