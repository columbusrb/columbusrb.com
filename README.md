# columbusrb.com

This is the web application for the [*Columbus Ruby Brigade*](http://columbusrb.com/).

### About
We are a bunch of professionals, students, and geeks who are excited about [*Ruby programming language*](http://ruby-lang.org/) and [*Rails framework*](http://rubyonrails.com/) and the joy they have brought back to web development. Our main goal is to share the love of the Ruby and Rails ecosystems to anyone that is interested. We cater to everyone, whether a non-programmer through advanced Rubyists. 

### How to Join
Just show up to one our our monthly meetings, you can RSVP for CRB and many other local tech events through the [*TechLife Columbus Meetup group*](http://meetup.com/techlifecolumbus). You should also check out our [*mailing list*](http://groups.google.com/group/columbusrb).

### Contributing
TODO: Add contributing information.

### Application Notes

Add an admin user with heroku console:

<pre>$ heroku run console
> Member.create(name: "Example User", email: "example@test.com", admin: true,
> password: "foobar", password_confirmation: "foobar")</pre>

Create a year of meetings with heroku console:

<pre>$ heroku run console
> Meeting.insert_meetings(desired_year)</pre>

This app uses reCAPTCHA to secure the sign up page. You need to register the domain with the [*reCAPTCHA website*](http://www.google.com/recaptcha), then add them to your [*Heroku configuration*](https://devcenter.heroku.com/articles/config-vars).

<pre>$ heroku config:set RECAPTCHA_PUBLIC_KEY='yourPublicKey'
$ heroku config:set RECAPTCHA_PRIVATE_KEY='yourPrivateKey'</pre>