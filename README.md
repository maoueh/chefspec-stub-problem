# Stubbing Problem

Trying to stub a library class method defined in `Chef::Recipe` class
which calls a program not accessible on the machine running the unit
tests.

The problem is that I'm simply unable to make it work correctly.

## Reproduce

    bundle install
    bundle exec rspec spec/recipes/default_spec.rb

Expected output is a passing test
Actual output is an error message saying command cannot be found

```
$ bundle exec rspec spec/recipes/default_spec.rb

Called in spec before: 1.3
Called in spec example: 1.3
Called in spec runner new: 1.3

...

================================================================================
Recipe Compile Error in /vagrant/stub_problem/recipes/default.rb
================================================================================

...

Failures:

  1) stub_problem::default includes default recipe
     Failure/Error: end.converge(described_recipe)
     Errno::ENOENT:
       No such file or directory - impossible_command_to_stub
     # ./libraries/stub_problem_library.rb:6:in `query'
     # ./recipes/default.rb:2:in `from_file'
     # ./spec/recipes/default_spec.rb:9:in `block (2 levels) in <top (required)>'
     # ./spec/recipes/default_spec.rb:27:in `block (2 levels) in <top (required)>'

Finished in 0.12096 seconds (files took 1.04 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/recipes/default_spec.rb:24 # stub_problem::default includes default recipe
```