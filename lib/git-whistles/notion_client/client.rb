
module Git
  module Whistles
    module NotionClient
      class Client

        def initialize(token)
          @client = create_client(token)
        end

        def page(page_id)
          response = JSON.parse(@client.get("/v1/pages/#{page_id}").body)
          {
            title: response['properties']['Name']['title'][0]['plain_text'],
            id: response['id'],
            url: response['url'],
          }
        end

        private

        def create_client(token)
          Faraday.new(
            url: 'https://api.notion.com',
            headers: {
              'Authorization' => "Bearer #{token}",
              'Notion-Version' => '2022-06-28',
              'Content-Type' => 'application/json',
            },
          ) do |faraday|
            faraday.response :logger, nil, { bodies: true, log_level: :debug }
          end
        end
      end
    end
  end
end