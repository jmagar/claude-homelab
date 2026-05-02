Servers and Tests | Gotify
[Skip to content](#VPContent)
Menu
Return to top
# Servers and Tests [​](#servers-and-tests)
## Start development servers [​](#start-development-servers)
### Backend [​](#backend)
The backend needs a built ui. Run
bash
```
`$ (cd ui && yarn build)`
```
Start the server in development mode.
bash
```
`$ go run .`
```
### UI [​](#ui)
Start the UI development server.
*Commands must be executed inside the ui directory.*
bash
```
`$ yarn start`
```
Open `http://localhost:3000` inside your favorite browser.
The UI requires a Gotify server running on `localhost:80`. This can be adjusted inside [ui/src/index.tsx](https://github.com/gotify/server/blob/master/ui/src/index.tsx).
## Update Swagger spec [​](#update-swagger-spec)
The [gotify/server REST-API](/api-docs) is documented via Swagger. The Swagger definition is generated via source code comments ([example comment](https://github.com/gotify/server/blob/09c1516a170dfb47d29644db622655b540b94922/api/application.go#L33)).
After changing such a source code comment, you can run the following command to update the Swagger definition.
bash
```
`$ make update-swagger`
```
## Tests [​](#tests)
### Execute Backend Tests [​](#execute-backend-tests)
#### Run tests with parallelism [​](#run-tests-with-parallelism)
bash
```
`$ go test ./...`
```
#### Run Tests with Coverage [​](#run-tests-with-coverage)
bash
```
`$ make test-coverage
$ go tool cover -html=coverage.txt # get a HTML coverage report`
```
#### Run Tests with Race Detector [​](#run-tests-with-race-detector)
bash
```
`$ make test-race`
```
### Execute UI (end2end) Tests [​](#execute-ui-end2end-tests)
Build the ui because the end2end test should be run against the production build. (This needs to be done on every change in the UI)
bash
```
`$ (cd ui && yarn build)`
```
Now execute the tests with yarn
bash
```
`$ (cd ui && yarn test)`
```
### Execute Static Checks [​](#execute-static-checks)
The following command checks the formatting and executes some linters like tslint and govet.
bash
```
`$ make check`
```