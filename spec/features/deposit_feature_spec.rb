describe 'Feature: Deposit' do

  let(:client) { Client.new }

  it 'adds the deposit money to the balance' do
    client.deposit(500)
    expect(client.balance).to eq 500
  end

end
