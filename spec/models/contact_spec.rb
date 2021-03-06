require 'rails_helper'

RSpec.describe Contact, type: :model do

  before(:each) do
    @contact = create(:contact)
  end

  it 'should be valid' do
    expect(@contact).to be_valid
  end

  it 'should have a valid name' do
    @contact.name = "  "
    expect(@contact).to_not be_valid
  end

  it "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @contact.email = valid_address
      expect(@contact).to be_valid, "#{valid_address.inspect} should be valid"
    end
  end

  it "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @contact.email = invalid_address
      expect(@contact).to_not be_valid, "#{invalid_address.inspect} should be invalid"
    end
  end

  it 'should have a valid message' do
    @contact.message = "  "
    expect(@contact).to_not be_valid
  end

end
