describe 'Feature: Deposit' do

  let(:client) { Client.new }

  it 'adds the deposit money to the balance' do
    expect { client.deposit(500) }.to change { client.balance }.by(500)
  end

end
