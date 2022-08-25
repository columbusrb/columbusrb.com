## Contributing

We love pull requests from everyone. We'd like for people to be encouraged to contribute, especially early career or people new to programming. [Join our Slack organization](https://crb-slack-invite.herokuapp.com/) and hit up the #general channel if you get stuck. There are many kind people there who will gladly give you a hand!

Fork, then clone the repo:

```
git@github.com:your-username/columbusrb.com.git
```
Docker is required to easily set up the environment. [Get Docker here](https://www.docker.com) 

After Docker is installed, start the development server by running the following command:

```
docker-compose up 
```
If you want everything to run in the background, you can use `docker-compose up -d`

In certain cases, if you update gems, you may need to rebuild the docker containers to install the new dependencies. This is easily done with:

```
script/rebuild
```

View in your browser at [http://localhost:3000/](http://localhost:3000/)

A breakdown of the various scripts:

```
script/run     # Execute arbitrary commands in the web container.  E.g.,
               #   script/run bin/rails runner 'puts BoardMember.count'
script/test    # Run "rake" in the web container.
script/console # Run "rails console" in the web container.
script/cleanup # Remove the development containers.
script/rebuild # Rebuild the web container. Useful if it is missing new gems.
```

Make your change. Push to your fork and [submit a pull request][pr].

[pr]: https://github.com/columbusrb/columbusrb.com/compare/

At this point, you are waiting on us. We like to at least comment on pull requests within three business days (and, typically, one business day). We may suggest some changes or improvements or alternatives.

## Trouble Shooting Environment Setup

If you run into any issues, please, don't hesitate to reach out to us on [Slack!](https://crb-slack-invite.herokuapp.com/)
