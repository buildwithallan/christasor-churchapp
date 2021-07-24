# christAsor
A church management application for administrators to capture detailed member information, leaders, and church operations for effective engagement.

## Features
- Membership
- Department
- Group
- Finance

## Technologies used
- Ruby On Rails
- Alpine.js
- Tailwindcss

## How to run the project locally
### Configuration
#### Clone this repository
```
$ git clone https://github.com/buildwithallan/christasor-churchapp.git
```

#### Navigate to the project directory
```
$ cd christasor-churchapp
```
#### Install dependencies from the gemfile
```
$ bundle install
```

### Database creation and initialization

#### Create database
```
$ rails db:create
```

#### Migrate database
```
$ rails db:migrate
```

### Running the server
You can start the server by running the command below:
```
$ rails s
```
### How to run the test suit
```
$ rspec
```
### Functions of Accounts

#### Superadmin
- Only superadmin have access to the finance feature
- Create a user account

#### Administrator(Superadmin & Admin)
- Create and manage church members
- Create and manage Groups
- Create and manage Departments

### Login Credentials

#### Login as superadmin
email: superadmin@superadmin.com

password: superadmin1234

#### Login as an admin
email: admin@admin.com

password: admin1234

## Deployed Project
You can find the deployed project at http://christasor-churchapp.herokuapp.com/
