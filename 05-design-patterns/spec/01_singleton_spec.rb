require 'singleton'

describe Singleton do
  let(:s1) { Singleton.create }
  let(:s2) { Singleton.create }
  it 'all instance var shold point to the same instance' do
    expect(s1).to eq(s2)
  end
end
