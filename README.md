[api-docs]: https://apidocs.natero.com/
[free-sw]:  https://www.fsf.org/licensing/essays/free-sw.html
[issues]:   https://github.com/bonusly/natero/issues
[fork]:     http://help.github.com/fork-a-repo/
[branch]:   http://learn.github.com/p/branching.html
[pr]:       http://help.github.com/send-pull-requests/

# Natero Gem
A Ruby interface for the [Natero Public API][api-docs].

## Installation
```Bash
gem install natero
```

## Examples
Significant functionality is covered with this gem, but some basic functionality is covered below.
If you're interested in learning more, it's probably easiest to explore the specs in `/spec/natero`.

Set up your keys:
```Ruby
Natero.configure do |c|
  c.account_api_key = 'ACCOUNT_API_KEY'
  c.event_api_key   = 'EVENT_API_KEY'
  c.event_auth_key  = 'EVENT_AUTH_KEY'
end
```

Retrieve all accounts:
```Ruby
Natero::Account.retrieve_all
```

Retrieve a specific account:
```Ruby
Natero::Account.retrieve('ACCOUNT_ID')
```

Modify an account:
```Ruby
account = Natero::Account.retrieve('ACCOUNT_ID')
account.name = 'TEST'
 
Natero::Account.modify('ACCOUNT_ID', account)
```

Create an event:
```Ruby
event   = { id: 'test', name: 'Testing the API.'}
details = 'These details should be associated with the event in Natero'
 
Natero::Event.create(event, details)
```

## Contributing
In the spirit of [free software][free-sw], **everyone** is encouraged to help
improve this project. Here are some ways *you* can contribute:

* Report bugs.
* Suggest new features.
* Write or edit documentation.
* Write specifications.
* Write code (**no patch is too small**: fix typos, add comments, clean up inconsistent whitespace).
* Refactor code.
* Fix [issues][].

#### Submitting an issue:
We use the [GitHub issue tracker][issues] to track bugs and features. Before
submitting a bug report or feature request, check to make sure it hasn't
already been submitted. When submitting a bug report, please include a stack 
trace and any details that may be necessary to reproduce
the bug, including your gem version, Ruby version, and operating system.
Ideally, a bug report should include a pull request with failing specs.

#### Submitting a Pull Request
1. [Fork the repository.][fork]
2. [Create a topic branch.][branch]
3. Add specs for your unimplemented feature or bug fix.
4. Run `bundle exec rake spec`. If your specs pass, return to step 3.
5. Implement your feature or bug fix.
6. Run `bundle exec rake spec`. If your specs fail, return to step 5.
7. Add documentation for your feature or bug fix.
8. Commit and push your changes.
9. [Submit a pull request.][pr]

_(Shamelessly based on the [Twitter Gem](https://github.com/sferik/twitter))_
