require 'spec_helper'

describe ReadLater do

  context 'with valid parmaters' do
    it 'returns ok' do
      with_api ReadLater do
        get_request query: { url: '/test'} do |request|
          response = Yajl::Parser.parse request.response
          response.should eq 'OK'
        end
      end
    end
  end

  context 'with missing url' do
    it 'returns ok' do
      with_api ReadLater do
        get_request query: {} do |request|
          response = Yajl::Parser.parse request.response
          response['error'].should eq 'Url identifier missing'
        end
      end
    end
  end
end
