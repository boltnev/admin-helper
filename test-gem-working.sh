#!/bin/bash

gem uninstall admin-helper -x
gem build admin-helper.gemspec
gem install -l admin-helper-0.0.1.gem
admin-helper
