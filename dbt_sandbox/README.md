# Using the dbt Core for development and testing

## Install gcloud CLI

In order to authenticate to GCP locally, download and install the [gcloud CLI](https://cloud.google.com/sdk/docs/install).

## Adding and running a model

- Create a new folder inside of the models directory that matches the name of the dataset where you want test tables to appear

### Add a model

- add a model.sql file to the dataset directory - the name of the file will be the name of the resulting table

- add a model.yaml file to the same directory using the same model name - this is where you can store metadata or add tests

### Run a model

To run a model (which deploys to a table in BQ):

`poetry run dbt run --select model_name_goes_here`

## Adding & running tests

See dbt documentation for adding [data tests](https://docs.getdbt.com/docs/build/data-tests) or [unit tests](https://docs.getdbt.com/docs/build/unit-tests). [Generic tests](https://docs.getdbt.com/docs/build/data-tests#generic-data-tests) are quick and easy.

example test command:

`poetry run dbt test --select model_name_goes_here`

## dbt resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
