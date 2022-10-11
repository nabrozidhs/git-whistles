require_relative 'bare'

require 'git-whistles/notion'

module Git
  module Whistles
    module PullRequest
      class Notion < Bare
        private

        def pr_command
          'notion-pr'
        end

        def tracker_related_params(team)
          page_id = options.from.split('/').last

          log.info 'Finding your Notion page¬'

          client = Git::Whistles::Notion.new.get_client rescue die('Aborting.')
          page = client.page(page_id)

          log.info "Found page #{page[:id]} in #{page[:url]}"

          {
            'pull_request[title]': page[:title],
            'pull_request[body]': page[:url],
          }
        end
      end
    end
  end
end
