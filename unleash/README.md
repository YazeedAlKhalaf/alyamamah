# Unleash - Deployment Config

Here is the config for deployment, I basically want a way for unleash to be deployable from the repository using code changes instead of the some UI.

So here is a `Dockerfile` that imports that image and is used by Google Cloud Run in combination with Cloud Build, just like the backend `quasar`.

I think this allows for a better developer experience.

## Setup

You need to provide the following details when making a Cloud Run service:

- `DATABASE_HOST`
- `DATABASE_PORT`
- `DATABASE_NAME`
- `DATABASE_USERNAME`
- `DATABASE_PASSWORD`
- `DATABASE_SSL`

More can be found at this doc: https://docs.getunleash.io/reference/deploy/configuring-unleash#database-configuration
