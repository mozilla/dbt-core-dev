# dbt Core ETL Development (using a sandbox)

This code repository is meant to be forked and used as a template for data practitioners to use dbt-core for local development and testing of models prior to deploying them to production.

It is set up to work with BigQuery and assumes users have GCP access with BigQuery permissions and can authenticate locally.

Mozilla does not currently have a production-ready dbt Core implementation and it is not on the roadmap. Some of our data practitioners find it productive to use dbt to deploy models for development and testing. This allows for easy facilitation of that.

## Why use dbt for development?

1. easy to deploy development tables (with subsets of data) to a sandbox environment for testing and analysis until logic is production-ready
2. [generic data tests](https://docs.getdbt.com/docs/build/data-tests#generic-data-tests)
3. [unit tests](https://docs.getdbt.com/docs/build/unit-tests#when-to-run-unit-tests)
4. description inheritance w/ [dbt Osmosis]()

## Getting started

### Local development environment setup

#### Fork this repo

Fork the repo and open in your preferred IDE

Note: if you'd like to contribute to the project (add shareable macros, column descriptions, etc. follow instructions in the [Contributing Guide](CONTRIBUTING.md))

#### Install Poetry & dependencies

- install [Poetry](https://python-poetry.org/docs/) on your machine using this command:

```bash
curl -sSL https://install.python-poetry.org | python3 -
```
- apply the following Poetry configuration:

```bash
# this will put venv in .venv folder at the root of project
poetry config virtualenvs.in-project true
```
- install dependencies

```bash
poetry install
```

#### Set up environment variable(s)

```bash
export SANDBOX_GCP_PROJECT_ID="your-sandbox-project-id"
```

Note: add the above line to your shell configuration to avoid setting it each time (or use .env if that is your preference)

#### Set up dbt profile

```bash
nano ~/.dbt/profiles.yml
```

- add this to `profiles.yaml`

```yaml
dbt_sandbox:
  outputs:
    dev:
      dataset: ads_derived
      job_execution_timeout_seconds: 300
      job_retries: 1
      location: US
      method: oauth
      priority: interactive
      project: "{{ env_var('NONPROD_PROJECT_ID') }}"
      threads: 4
      type: bigquery
  target: dev
```

See the dbt sandbox [README.md](/dbt_sandbox/README.md) for using dbt-core for testing and development
