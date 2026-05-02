OpenAPI Specification | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# OpenAPI Specification
Apprise API includes an OpenAPI 3 specification in `swagger.yaml` at the root of the repository [here](https://github.com/caronc/apprise-api/blob/master/swagger.yaml)
## Running Swagger UI
[Section titled “Running Swagger UI”](#running-swagger-ui)
For local development or API exploration, you can bring up a standalone Swagger UI that reads the specification file without changing how the main Apprise API runs.
### Via Docker Compose
[Section titled “Via Docker Compose”](#via-docker-compose)
Use the provided swagger compose file in the repository:
Terminal window
```
`
docker compose -f docker-compose.swagger.yml up -d
`
```
Then browse to: `http://localhost:8001`
Questions or Feedback?
#### Documentation
Notice a typo or an error?
[
Report it
](https://github.com/caronc/apprise-docs/issues/)
or
[
contribute a fix
](https://github.com/caronc/apprise-docs)
.
#### Technical Issues
Having trouble with the code? Open an issue on GitHub:
* [
Apprise Core & CLI
](https://github.com/caronc/apprise/issues/)
* [
Apprise API
](https://github.com/caronc/apprise-api/issues/)
Made with love from Canada