require 'rails_helper'

RSpec.describe Contentful::Entries do
  let(:sample) { File.read(File.expand_path('../../../dummy/sample_response.json', __FILE__)) }
  let(:response) { JSON.parse(sample) }

  describe '#fetch' do
    before do
      allow_any_instance_of(Net::HTTPResponse).to receive(:body).and_return(sample)
      allow_any_instance_of(Net::HTTP).to receive(:request).and_return(Net::HTTPResponse.new(200, {}, [sample]))
    end

    subject { described_class.new.fetch({ content_type: 'recipe' }) }

    it 'should return 4 recipes' do
      expect(subject.length).to eq(4)
    end

    it 'tags and chef lookup should match' do
      subject.each_with_index do |recipe, i|
        expect(recipe[:tags].length).to eq((response['items'][i].dig('fields', 'tags') || []).length)
        expect(recipe[:chef]).to be_kind_of(String) if response['items'][i]['fields'].key?('chef')
      end
    end
  end
end
