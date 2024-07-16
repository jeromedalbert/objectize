describe Objectize do
  describe '.to_object' do
    it 'converts a deeply nested hash to an object' do
      hash = {
        name: 'Alex',
        admin: false,
        address: {
          city: 'San Francisco'
        },
        friends: [{ name: 'Bob' }]
      }

      result = Objectize.to_object(hash)

      expect(result.name).to eq 'Alex'
      expect(result.admin).to eq false
      expect(result.address.city).to eq 'San Francisco'
      expect(result.friends.first.name).to eq 'Bob'
    end

    it 'converts an array of hashes to an array of objects' do
      hashes = [{ name: 'Alex' }, { name: 'Bob' }]

      results = Objectize.to_object(hashes)

      expect(results.first.name).to eq 'Alex'
      expect(results.last.name).to eq 'Bob'
    end
  end

  describe '.to_basic_type' do
    it 'converts an object to a hash' do
      object = Hashie::Mash.new(name: 'Alex')

      result = Objectize.to_basic_type(object)

      expect(result).to eq('name' => 'Alex')
    end

    it 'converts an array of objects to an array of hashes' do
      objects = [Hashie::Mash.new(name: 'Alex'), Hashie::Mash.new(name: 'Bob')]

      results = Objectize.to_basic_type(objects)

      expect(results.first).to eq('name' => 'Alex')
      expect(results.last).to eq('name' => 'Bob')
    end
  end
end
