#
# modified yaml backend to allow wildcard includes
# original file: https://github.com/puppetlabs/hiera/blob/master/lib/hiera/backend/yaml_backend.rb
# based on: https://github.com/puppetlabs/hiera/pull/169/files
#
# Copyright (C) 2014 Jordi Prats
#
# original author:
# Puppet - Automating Configuration Management.
#
# Copyright (C) 2012-2014 Puppet Labs Inc
#
# Puppet Labs can be contacted at: info@puppetlabs.com
#
# Licensed under the Apache License, Version 2.0 (the "License");
#
#
#
class Hiera
  module Backend
    class Yamlwildcard_backend


      def datasourcefiles(backend, scope, extension, override=nil, hierarchy=nil)
        datadir = Backend.datadir(backend, scope)
        Backend.datasources(scope, override, hierarchy) do |source|
          Hiera.debug("yamlwildcard: Looking for data source #{source}")
          files = datafile_in(datadir, source, extension)

          next if files.nil?

          files.each do |file|
            yield source, file
          end
        end
      end


      def datafile_in(datadir, source, extension)
        file = File.join(datadir, "#{source}.#{extension}")
        dir  = File.join(datadir, "#{source}")

        if File.exist?(file)
          files = [ file ]
          files
        elsif File.directory?(dir)
          files = Dir.glob(File.join(datadir, "#{source}/*"))
          if files.empty?
            Hiera.debug("yamlwildcard: Cannot find datafiles in #{files}, skipping")
            nil
          else
            files
          end
        else
          Hiera.debug("yamlwildcard: Cannot find datafile #{file}, skipping")
          nil
        end
      end

      def initialize(cache=nil)
        require 'yaml'
        Hiera.debug("Hiera YAML backend starting")

        @cache = cache || Filecache.new
      end

      def lookup(key, scope, order_override, resolution_type)
        answer = nil

        Hiera.debug("yamlwildcard: Looking up #{key} in YAML backend")

        datasourcefiles(:yaml, scope, "yaml", order_override) do |source, yamlfile|
          Hiera.debug("yamlwildcard: source #{source} yamlfile #{yamlfile}")
          data = @cache.read_file(yamlfile, Hash) do |data|
            YAML.load(data) || {}
          end

          next if data.empty?
          next unless data.include?(key)

          # Extra logging that we found the key. This can be outputted
          # multiple times if the resolution type is array or hash but that
          # should be expected as the logging will then tell the user ALL the
          # places where the key is found.
          Hiera.debug("yamlwildcard: Found #{key} in #{source}")

          # for array resolution we just append to the array whatever
          # we find, we then goes onto the next file and keep adding to
          # the array
          #
          # for priority searches we break after the first found data item
          new_answer = Backend.parse_answer(data[key], scope)
          case resolution_type
          when :array
            raise Exception, "Hiera type mismatch: expected Array and got #{new_answer.class}" unless new_answer.kind_of? Array or new_answer.kind_of? String
            answer ||= []
            answer << new_answer
          when :hash
            raise Exception, "Hiera type mismatch: expected Hash and got #{new_answer.class}" unless new_answer.kind_of? Hash
            answer ||= {}
            answer = Backend.merge_answer(new_answer,answer)
          else
            answer = new_answer
            break
          end
        end

        return answer
      end

      private

      def file_exists?(path)
        File.exist? path
      end
    end
  end
end
