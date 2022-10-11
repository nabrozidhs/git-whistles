require 'faraday'
require 'rubygems'
require 'optparse'
require 'cgi'
require 'term/ansicolor'
require 'git-whistles/app'
require 'git-whistles/notion_client/client'

module Git
  module Whistles
    class Notion
      attr_reader :token

      def initialize
        get_config
      end

      def get_client
        Git::Whistles::NotionClient::Client.new(@token)
      end

      def get_config
        @token = `git config notion.token`.strip
        if token.empty?
          puts Term::ANSIColor.yellow %Q{
            Your branch appears to have a page ID,
            but I don't know your Notion token!
            Please set it with:
            $ git config [--global] notion.token <token>
          }
          raise "Aborting."
        end
      end
    end
  end
end
