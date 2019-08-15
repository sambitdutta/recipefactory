require 'rails_helper'

RSpec.describe 'recipes index', type: :request do
  let(:sample) { File.read(File.expand_path('../../../dummy/sample_response.json', __FILE__)) }

  context do
    before do
      allow_any_instance_of(Net::HTTPResponse).to receive(:body).and_return(sample)
      allow_any_instance_of(Net::HTTP).to receive(:request).and_return(Net::HTTPResponse.new(200, {}, [sample]))
    end

    subject do
      get '/recipes', xhr: true
      response
    end

    it { is_expected.to have_http_status(:ok) }

    it 'returns 4 recipes' do
      response = JSON.parse(subject.body)
      expect(response.size).to eq(4)
    end
  end
end
