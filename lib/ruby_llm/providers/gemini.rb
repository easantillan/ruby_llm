# frozen_string_literal: true

module RubyLLM
  module Providers
    # Native Gemini API implementation
    module Gemini
      extend Provider
      extend Gemini::Chat
      extend Gemini::Embeddings
      extend Gemini::Images
      extend Gemini::Models
      extend Gemini::Streaming
      extend Gemini::Tools
      extend Gemini::Media

      module_function

      def api_base(config)
        config.gemini_api_base || 'https://generativelanguage.googleapis.com/v1beta'
      end

      def headers(config)
        headers = {
          'x-goog-api-key' => config.gemini_api_key
        }

        if config.global_headers
          headers.merge!(config.global_headers)
        end

        headers
      end

      def capabilities
        Gemini::Capabilities
      end

      def slug
        'gemini'
      end

      def configuration_requirements
        %i[gemini_api_key]
      end
    end
  end
end
