require 'client'

describe Client do

  subject { described_class.new }

  context '#deposit' do

    it { is_expected.to respond_to(:deposit).with(2).arguments }

  end

end
