# filebeat

[![Puppet Forge](http://img.shields.io/puppetforge/v/camptocamp/filebeat.svg)](https://forge.puppetlabs.com/camptocamp/filebeat)
[![Build Status](https://travis-ci.org/camptocamp/puppet-filebeat.png?branch=master)](https://travis-ci.org/camptocamp/puppet-filebeat)


## Overview

This module allows to install and configure [filebeat](https://www.elastic.co/beats/filebeat).


## Usage and examples

### Simple usage

```puppet
class { 'filebeat':
  brokers => 'broker1.example.com',
}
```

### Deploy inputs


```puppet
filebeat::input { 'foo':
  topic => 'app-log',
  paths => '/var/log/app/app*.log',
}
```
