# Photography web app
Ruby version used is 2.5.7

# The project
First clone the project into your local machine.
```
git clone git@github.com:emielhagen/photo-app.git
cd photo-app
```

Then, initialize the postgresql database and run migration file and seed file.
```
rails db:create
rails db:migrate
rails db:seed
```

If you do not have imagemagick installed on your machine, install it first. The gem minimagick is dependent on imagemagick. Minimagick lets you resize images easily, which is why it is included in the project.
```
brew install imagemagick
```

Another dependency is Bootstrap, make sure you have it installed. Bootstrap is used for the front-end in combination with the CSS grid. If Bootstrap is not yet installed, run:
```
yarn add bootstrap
```

Start a rails server
```
rails s
```
And you will be able to use the application [Photo app](http://localhost:3000/)

Devise is added for users and only the homepage is excepted from logging in. All other pages require you to create a user profile first. Once this is done, the app is accessible fully. It is currently just set up so that multiple users can add and edit photo albums from themself and others. If required this could be restricted to self uploaded material. Favoriting photos from any album is already user specific.

# CSS
I have structured the css primarily in components. This way it is easy to re-use and easy to find.

# Tests

To run the rspec tests execute following command in terminal.
```
bundle exec rspec
```

# Error handling
I've added an ErrorHandler module:

```
lib/error
```

It is included it in the ApplicationController. Reason is to handle errors on a global level, and this way I just had to include it in the application controller. To load the module on App startup I've added it in config/application.rb.

Rescue StandardError acts as a Fallback mechanism to handle any exception.

