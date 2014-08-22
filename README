This gem provides CLI support to an [Interpres server](https://github.com/dncrht/interpres).

# Set up

You've installed the gem:
`gem install interpres`

You have an _interpres_ server, with an app configured.

You've set the proper environmental variables:
```bash
export INTERPRES_USER=your_user
export INTERPRES_PASSWORD=your_password
export INTERPRES_TOKEN=your_app_token
export INTERPRES_URL=http://host.domain.tld
```

# Workflow

Gather all the translatable strings from your app:
```bash
$ cd my_awesome_app
$ interpush .
```

It will upload them to the server.

After you're done with the translations:
```bash
$ interpull locale
```

It will download them to the `locale` directory.
