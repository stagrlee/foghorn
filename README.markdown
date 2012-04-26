FogHorn - OpenStack Testing Framework
=========================================
 
## Introduction

FogHorn is a cucumber-based testing framework used to validate OpenStack system deployments.
Its aim is to simplify testing of underlying OpenStack sub-systems in order to validate that
everything has been deployed and configured properly.

## Getting Started


### Pre-requisites

* Ruby (this has been tested on Ruby 1.9.3)
* RubyGems
* Bundler

### Getting Ready To Test

Once all the required software has been installed, run the following command:

    bundle install

This will install the Fog client, the Cucumber framework and other dependencies.

### Configuring the Framework

To configure the framework to point to your specific OpenStack system, edit the env.rb 
file found in the features/support directory.

### Running the Tests

To run the test suite, run the following command:

    bundle exec cucumber

