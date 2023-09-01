# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  describe '#execute' do
    context 'when in development environment' do
      before { allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new('development')) }

      it 'handles error in development' do
        allow(InTheFieldBeSchema).to receive(:execute).and_raise(StandardError, 'Test error')

        post :execute, params: { query: 'your_test_query' }

        expect(response).to have_http_status(500)
        json_response = JSON.parse(response.body)
        expect(json_response['errors']).to be_an(Array)
        expect(json_response['errors'][0]['message']).to eq('Test error')
      end
    end

    context 'when not in development environment' do
      before { allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new('production')) }

      it 'does not handle error outside development' do
        allow(InTheFieldBeSchema).to receive(:execute).and_raise(StandardError, 'Test error')

        expect do
          post :execute, params: { query: 'your_test_query' }
        end.to raise_error(StandardError, 'Test error')
      end
    end
  end

  describe '#prepare_variables' do
    it 'parses JSON string and returns a hash' do
      json_string = '{"key": "value"}'

      result = controller.send(:prepare_variables, json_string)

      expect(result).to be_a(Hash)
      expect(result).to eq({ 'key' => 'value' })
    end

    it 'returns an empty hash for empty JSON string' do
      empty_json_string = ''

      result = controller.send(:prepare_variables, empty_json_string)

      expect(result).to be_a(Hash)
      expect(result).to be_empty
    end

    it 'returns a hash unchanged' do
      hash = { key: 'value' }

      result = controller.send(:prepare_variables, hash)

      expect(result).to be_a(Hash)
      expect(result).to eq(hash)
    end

    it 'converts ActionController::Parameters to hash' do
      parameters = ActionController::Parameters.new(key: 'value')

      result = controller.send(:prepare_variables, parameters)

      expect(result).to be_a(Hash)
      expect(result).to eq({ 'key' => 'value' })
    end

    it 'returns an empty hash for nil input' do
      result = controller.send(:prepare_variables, nil)

      expect(result).to be_a(Hash)
      expect(result).to be_empty
    end

    it 'raises ArgumentError for unexpected input' do
      unexpected_input = 123

      expect do
        controller.send(:prepare_variables, unexpected_input)
      end.to raise_error(ArgumentError, "Unexpected parameter: #{unexpected_input}")
    end
  end
end
