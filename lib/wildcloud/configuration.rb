# Copyright 2011 Marek Jelen
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'yaml'

module Wildcloud
  module Configuration

    def self.load(component)
      SimpleBackend.new(component)
    end

    class SimpleBackend

      attr_reader :configuration, :sources

      def initialize(component)
        @configuration ||= {}
        @sources = [
            '/etc/wildcloud/wildcloud.yml',
            './wildcloud.yml',
            "/etc/wildcloud/#{component}.yml",
            "./#{component}.yml"
        ]

        @sources.delete_if do |file|
          not File.exist?(file)
        end

        @sources.each do |file|
          config = YAML.load_file(file)
          @configuration.merge!(config) if config
        end

      end

    end

  end
end