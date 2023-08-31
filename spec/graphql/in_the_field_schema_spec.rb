# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InTheFieldBeSchema do
  describe '.resolve_type' do
    it 'raises an error for abstract type resolution' do
      expect do
        described_class.resolve_type(nil, nil, nil)
      end.to raise_error(GraphQL::RequiredImplementationMissingError)
    end
  end

  describe '.id_from_object' do
    it 'returns a string UUID for an object' do
      object = double(to_gid_param: 'fake_uuid')
      result = described_class.id_from_object(object, nil, nil)
      expect(result).to eq('fake_uuid')
    end
  end

  describe '.object_from_id' do
    it 'finds the object from a string UUID' do
      object = double
      allow(GlobalID).to receive(:find).with('fake_uuid').and_return(object)
      result = described_class.object_from_id('fake_uuid', nil)
      expect(result).to eq(object)
    end
  end
end
