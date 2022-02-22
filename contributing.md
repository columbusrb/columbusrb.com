## Contributing

We love pull requests from everyone. We'd like for people to be encouraged to contribute, especially early career or people new to programming. [Join our Slack organization](https://crb-slack-invite.herokuapp.com/) and hit up the #general channel if you get stuck. There are many kind people there who will gladly give you a hand!

Fork, then clone the repo:

```
git@github.com:your-username/columbusrb.com.git
```

If Docker is installed start the development server by running the following scripts:

```
script/setup
script/server
```

In certain cases, if you update gems, you may need to rebuild the docker containers to install the new dependencies. This is easily done with:

```
script/rebuild
```

If Docker is not installed, please [install][dk]
[dk]: https://www.docker.com

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
script/rebuild # Rebuild the web container. Useful if it is missing new gems.
```

A pre-requisite is having Docker installed.

Make your change. Push to your fork and [submit a pull request][pr].

[pr]: https://github.com/columbusrb/columbusrb.com/compare/

At this point, you are waiting on us. We like to at least comment on pull requests within three business days (and, typically, one business day). We may suggest some changes or improvements or alternatives.

## Trouble Shooting Environment Setup

- Issue: `script/setup` is throwing a fuss about the rails environment being wrong:

You need to set the environment variable through Docker. Run:
```shell
script/run rails db:environment:set RAILS_ENV=development
```
and try once more!
- Issue: If `script/server` exits with status code 1 saying the server already exists:

This happens if the the server you just ran did not have enough time to exit gracefully before closing. In that case, even if you are not running another instance of the container, the program thinks you are because a lingering artifact - specifically, a `.pid` file. You need to find that file and destroy it. Here is the path:
```
/tmp/pids/server.pid
``` 
`ctl + c` and try once more!

---
If you run into any other issues, please, don't hesitate to reach out to us on [Slack!](https://crb-slack-invite.herokuapp.com/)