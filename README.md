# hiera - yaml_wildcard

hacky yaml backend

```
root@19f567c6288d:/usr/lib/ruby/vendor_ruby/hiera# hiera classes ::fqdn=aaa -d
DEBUG: 2015-11-15 18:16:17 +0100: Hiera YAML backend starting
DEBUG: 2015-11-15 18:16:17 +0100: yamlwildcard: Looking up classes in YAML backend
DEBUG: 2015-11-15 18:16:17 +0100: yamlwildcard: Looking for data source _/common-
DEBUG: 2015-11-15 18:16:17 +0100: yamlwildcard: Cannot find datafile /etc/puppet/hieradata/_/common-.yaml, skipping
DEBUG: 2015-11-15 18:16:17 +0100: yamlwildcard: Looking for data source _/common
DEBUG: 2015-11-15 18:16:17 +0100: yamlwildcard: source _/common yamlfile /etc/puppet/hieradata/_/common/kk.yaml
DEBUG: 2015-11-15 18:16:17 +0100: yamlwildcard: source _/common yamlfile /etc/puppet/hieradata/_/common/kk2.yaml
DEBUG: 2015-11-15 18:16:17 +0100: yamlwildcard: source _/common yamlfile /etc/puppet/hieradata/_/common/kk3.yaml
DEBUG: 2015-11-15 18:16:17 +0100: yamlwildcard: Looking for data source common-
DEBUG: 2015-11-15 18:16:17 +0100: yamlwildcard: Cannot find datafile /etc/puppet/hieradata/common-.yaml, skipping
DEBUG: 2015-11-15 18:16:17 +0100: yamlwildcard: Looking for data source common
DEBUG: 2015-11-15 18:16:17 +0100: yamlwildcard: source common yamlfile /etc/puppet/hieradata/common.yaml
DEBUG: 2015-11-15 18:16:17 +0100: yamlwildcard: Found classes in common
[]
```
