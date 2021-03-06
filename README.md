# hiera - yaml_wildcard

hacky yaml backend for puppet3. The wildcard feature provided by this module is already included in hiera5, so this backend makes no longer sense

## Installation



### Method 1

Download the source:

```
git clone https://github.com/jordiprats/hiera-yaml_wildcard
```

Build the gem:

```
cd hiera-yaml_wildcard && gem build hiera-yaml_wildcard.gemspec
```

Install it (the filename/version may vary):

```
sudo gem install hiera-yaml_wildcard-0.1.0.gem
```

### Method 2

*IMPORTANT NOTE* hiera_yaml_wildcard also ships as a Puppet module, which can be synced with the puppet master using pluginsync, if you are using this model, please read [SERVER-571](https://tickets.puppetlabs.com/browse/SERVER-571) - At the time of this release no decision has been made on long term support for shipping hiera backends as modules.

```
puppet module build
puppet module install pkg/eyp-hiera_yaml_wildcard-0.1.0.tar.gz
```

Example
=======

```
root@a2af3db45023:/# hiera classes ::fqdn=aaa -d
DEBUG: 2015-11-23 12:32:31 +0100: Hiera YAML backend starting
DEBUG: 2015-11-23 12:32:31 +0100: yamlwildcard: Looking up classes in YAML backend
DEBUG: 2015-11-23 12:32:31 +0100: yamlwildcard: Looking for data source demo/common-
DEBUG: 2015-11-23 12:32:31 +0100: yamlwildcard: Cannot find datafile in /etc/puppet/hieradata/demo/common-.yaml, skipping
DEBUG: 2015-11-23 12:32:31 +0100: yamlwildcard: Looking for data source demo/common
DEBUG: 2015-11-23 12:32:31 +0100: yamlwildcard: Cannot find datafile in /etc/puppet/hieradata/demo/common.yaml, skipping
DEBUG: 2015-11-23 12:32:31 +0100: yamlwildcard: source demo/common yamlfile /etc/puppet/hieradata/demo/common/kk.yaml
DEBUG: 2015-11-23 12:32:31 +0100: yamlwildcard: source demo/common yamlfile /etc/puppet/hieradata/demo/common/kk2.yaml
DEBUG: 2015-11-23 12:32:31 +0100: yamlwildcard: source demo/common yamlfile /etc/puppet/hieradata/demo/common/kk3.yaml
DEBUG: 2015-11-23 12:32:31 +0100: yamlwildcard: Looking for data source common-
DEBUG: 2015-11-23 12:32:31 +0100: yamlwildcard: Cannot find datafile in /etc/puppet/hieradata/common-.yaml, skipping
DEBUG: 2015-11-23 12:32:31 +0100: yamlwildcard: Looking for data source common
DEBUG: 2015-11-23 12:32:31 +0100: yamlwildcard: source common yamlfile /etc/puppet/hieradata/common.yaml
DEBUG: 2015-11-23 12:32:31 +0100: yamlwildcard: Found classes in common
[]
```
