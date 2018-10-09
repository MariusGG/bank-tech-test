describe 'Feature: Legal Tender' do

  let(:client) { Client.new }

  it 'raises an error if the client tries to deposit illegal tender' do
    expect { client.deposit(500.005) }.to raise_error('Illegal tender!')
  end

  it 'raises an error if the client tries to withdraw illegal tender' do
    expect { client.withdraw(500.005) }.to raise_error('Illegal tender!')
  end

end
