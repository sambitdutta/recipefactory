require 'rails_helper'

RSpec.describe Contentful::Entries do
  let(:sample) { File.read(File.expand_path('../../../dummy/sample_response.json', __FILE__)) }

  describe '#fetch' do
    before do
      allow_any_instance_of(Net::HTTPResponse).to receive(:body).and_return(sample)
      allow_any_instance_of(Net::HTTP).to receive(:request).and_return(Net::HTTPResponse.new(200, {}, [sample]))
    end

    subject { described_class.new.fetch({ content_type: 'recipe' }) }

    it 'should return 4 recipes' do
      expect(subject.length).to eq(4)
    end
  end
end
