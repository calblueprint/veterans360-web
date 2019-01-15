## Welcome to Veterans 360!!

**Veterans 360** is a San Diego based nonprofit that helps young veterans cope with transition and PTS/TBI challenges and has supported hundreds of young veterans with everything from simple financial support to complete PTS and mental health support. Their mission is to help today’s young combat veterans succeed in tomorrow’s world through a process of engagement, education, advocacy and healing.

## Developer Setup

**NOTE:** The following instructions will cover how to setup both [the web repository](https://github.com/calblueprint/veterans360-web) as well as [the mobile repository](). Setup for both of these components will be required to develop locally, as the mobile app communicates regularly with the web server.

### Web Setup

This project is built on Rails 5.1, and it's recommended that you use a version of ruby that's >= 2.4. If you do not already have Rails installed on your system, please see a resource such as [this](http://railsapps.github.io/installrubyonrails-mac.html), but make sure that you are installing Rails 5.1.

Then, you should clone the repository from GitHub into a directory that you desire.

```
git clone https://github.com/calblueprint/veterans360-web.git
cd veterans-360-web
```

You'll need to make sure that you have [bundler](https://bundler.io/), and then try to run the following command to install all the gems we're using for this particular repository:

```
bundle install
```

Next, we're going to setup our database, for which we use PostgreSQL, a robust relational database. The default Rails database is `sqlite`, so we'll have to do some extra work on our end here. The database is a service that we will run in the background (which can receive connections/requests from out backend), and we will manage starting and stopping the service using [Homebrew](https://brew.sh/). Once you've installed Homebrew, you'll also want to install Homebrew's services manager:

```
brew tap homebrew/services
```

Then, install PostgreSQL:

```
brew install postgresql
```

You can start the database service by running the following command (you can feel free to leave it running in the background).

```
brew services start postgresql
```

Then, if you'd like to stop the database service (note: this will not allow your rails server to serve or write any data) after you've finished development, run this following command. _Don't run it now, though._

```
brew services stop postgresql
```

Once the database service is setup, we need to create the database tables used for this project. There is an easy command to get everything set up:

```
rails db:create
```

Then, you will need to migrate the database to apply all schema changes that been applied to this database over time.

```
rails db:migrate
```

At this point you have everything set up for development on the web end, and you can start running the server.

```
rails server -b 0.0.0.0

# Note: `rails server` is also OK, but you'll want to run the above command to bind the server
# to your device's IP. This is so that the mobile device can connect to the server later on.
```

### Mobile Setup

Just like with the backend, let's clone the mobile repo:

```
git clone https://github.com/calblueprint/veterans360-mobile.git
cd veterans-360-mobile
```

We develop the mobile app on React Native using a framework called Expo. Expo allows for super quick setup and deployment of React Native projects. In order to use Expo as a developer, you have to have the [Expo app](https://expo.io/tools#client) installed for your iOS or Android device. You will be able to view the Veterans application "locally" through this app. Then, the rest of the steps you'll have to complete on your computer to run the mobile server.

You can use either NPM or Yarn to manage your `npm` packages, but I prefer Yarn. Skip this step and use NPM if that is so desired.

```
brew install yarn
```

We now need to install the Expo CLI--run the following command:

```
yarn add global expo-cli
```

You may need to setup additional configuration and create an Expo account at this point. And you also need to download the Expo SDK. Make sure you use version 31.0.0, which can be found [here](https://github.com/expo/react-native/archive/sdk-31.0.0.tar.gz).

Make sure that you are in the `veterans-360-mobile` directory, and then install the npm packages we've specified by running this command:

```
yarn install
```

Run this script to start running the mobile development server:

```
expo start
```

Now, most things are setup properly, but there is one final step to make sure that the mobile app can actually communicate with the web server that is running (you should have a terminal tab running `rails -b 0.0.0.0` at this point).

Create a file called `secrets.js` that lives in the `/helpers` folder. The path of this file relative to the project root should be `/helpers/secrets.js`. It should contain the following contents:

```javascript
const HOST_ADDR = "[YOUR_IP]:3000";

export { HOST_ADDR };
```

Then, you'll need to replace the `[YOUR_IP]` part with your device's IP on this network. You can find it by looking at the tab that is running `expo start` for an IP address above the QR code. Save that file after you've put in your IP, and then the mobile-to-web connection should be complete. Make sure that you change this file every time you switch networks. If you find that your server is unable to receive incoming messages from the mobile app one day, then it is very likely that you forgot to change the IP to the newly obtained IP of your computer on the network.

That's all there is to the setup. Happy developing!

## Cal Blueprint

**[Cal Blueprint](http://www.calblueprint.org/)** is a student-run UC Berkeley organization devoted to matching the skills of its members to our desire to see social good enacted in our community. Each semester, teams of 4-5 students work closely with a non-profit to bring technological solutions to the problems they face every day.
