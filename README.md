# Web JS Project Scaffold

[![Build Status](https://travis-ci.org/bbmoz/webjs-project-scaffold.svg?branch=master)](https://travis-ci.org/bbmoz/webjs-project-scaffold)

> This is a scaffold for building js-based browser projects.

## Tasks
1. `npm start`                *run app at **http://localhost:8080***
1. `npm test`                 *lint and run tests*
1. `npm test -- --watch`      *run tests in TDD mode*
1. `npm install`              *install npm deps*
1. `npm run test:fn`          *run functional tests (requires tunnel and app to be running)*
1. `npm run test:fn:ngrok`   *expose local app (make sure to copy address to `WEB_URL` in **.envrc**), inspect at **http://localhost:4040***
1. `npm run test:fn:hotel`    *start process manager at **http://localhost:2000***
