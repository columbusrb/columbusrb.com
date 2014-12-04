## Columbus Ruby Brigade Website

### About
TODO: Add some information about CRB

### How to Join
TODO: Add steps on how to join

### Contributing
TODO: Add contributing information.

### Application Notes

Add an admin user with heroku console:

<pre>$ heroku run console
> Member.create(name: "Example User", email: "example@test.com", admin: true, password: "foobar", password_confirmation: "foobar")</pre>

Create a year of meetings with rails console:

<pre>$ heroku run console
> Meeting.insert_meetings(desired_year)</pre>

This app uses reCAPTCHA to secure the sign up page. You need to register the domain with the [*reCAPTCHA website*](http://www.google.com/recaptcha), then add them to your [*Heroku configuration*](https://devcenter.heroku.com/articles/config-vars).

<pre>$ heroku config:set RECAPTCHA_PUBLIC_KEY='yourPublicKey'
$ heroku config:set RECAPTCHA_PRIVATE_KEY='yourPrivateKey'</pre>