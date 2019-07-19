# PlantPal
## a project by Benjamin Joham, Daniela Kubesch and Johanna Repp

Throughout the whole project we do pair programming.

# Dokku
https://plantpal.projects.multimediatechnology.at/

**Brigitte fragen**

## Rubocop Options

> Simple format <br> >`rubocop --format simple`

> Simple format written to result.txt <br> > `rubocop --format simple -o result.txt`

> Useful for CI environments. It will create an HTML report <br> >`rubocop --format html -o rubocop.html`

## Usage of Gems

### annotate

> link [annotate-github](github.com/ctran/annotate_models)

#### How to

run `annotate` in root of your project

#### What's it doing?

inserts the db schema as comments in your model.rb file <br>
changes model files!

### railroady

> link [railroady-github](github.com/preston/railroady)

#### How to

run `rake diagram:all` to create a _models_complete.svg_

#### What's it doing?

UML diagram generation for Rails projects, capable of analyzing existing models and controllers

<!-- TODO: Potentielle Alternative zu rmagick -->

### lib-vips

> link [lib-vips](https://github.com/libvips/ruby-vips)

### devise

> link [devise-github](https://github.com/plataformatec/devise)

### friendly_id

> link [friendly_id-github](https://github.com/norman/friendly_id)

#### How to

Add a slug column to the desired table (e.g. Users)
`rails g migration AddSlugToUsers slug:uniq`

Generate the friendly configuration file and a new migration
`rails generate friendly_id`

#### What's it doing?

With FriendlyId, it's easy to make your application use URLs like:
`http://example.com/states/washington`

instead of:
`http://example.com/states/4323454`

### brita

> link [brita-github](https://github.com/procore/sift)

### searchkick

> link [searchkick](https://github.com/ankane/searchkick)

#### How To

FIXME: probably need to install and start _elasticsearch_ with brew

### Active Admin

> link [Active Admin](https://activeadmin.info/documentation.html)

#### How to

1. `rails generate actice_admin:install`
2. `rails db:migrate` or `rake db:migrate`
3. start server again `rails server`

### letter_opener

> link [letter_opener-github](https://github.com/ryanb/letter_opener)

#### How to

Set the delivery method in **config/environments/development.rb**

`config.action_mailer.delivery_method = :letter_opener`
`config.action_mailer.perform_deliveries = true`

Configuration

```Ruby
LetterOpener.configure do |config|
  # To overrider the location for message storage.
  # Default value is <tt>tmp/letter_opener</tt>
  config.location = Rails.root.join('tmp', 'my_mails')

  # To render only the message body, without any metadata or extra containers or styling.
  # Default value is <tt>:default</tt> that renders styled message with showing useful metadata.
  config.message_template = :light
end
```

## JOBS

rails is able to run "jobs" once a day/once per hour

# Aufbau

Models:

- User
- Plants

Controller:

Views:

Serializer:

Mailer:

## API's

[trefle.io](https://trefle.io/reference)

[plant.id](https://plant.id/api)
