require 'rails_helper'

RSpec.describe User, type: :model do

  subject {described_class.new(first_name: 'Jasper', last_name: 'Peppermint', email: 'jpeppermint@fictionalmail.com', password: 'Mmmmm', password_confirmation: 'Mmmmm')}
  
  describe 'Validations' do
    
    it 'saves successfully when all four feilds are set' do
      subject.valid?
      expect(subject.errors).to be_empty
    end
    
    it 'fails to save when password is not entered' do
      subject.password = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
    end

    it 'fails to save when password confirmation is not entered' do
      subject.password_confirmation = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
    end

    it 'fails to save when password and password confirmation do not match' do
      subject.password_confirmation = 'IHeartTesting'
      subject.valid?
      expect(subject.errors).not_to be_empty
    end

    it 'fails to save when email is not entered' do
      subject.email = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
    end

    it 'fails to save when first name is not entered' do
      subject.first_name = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
    end

    it 'fails to save when last name is not entered' do
      subject.last_name = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
    end

    it 'fails to save when email is not unique regardless if upper or lower case' do
      User.create(first_name: 'Jasper', last_name: 'Peppermint', email: 'jPeppermint@fictionalmail.com', password: 'Mmmmm', password_confirmation: 'Mmmmm', :password_digest => '111')
      subject.valid?
      expect(subject.errors).not_to be_empty
    end

    it 'fails to save when password and password_confirmation is less than length 5' do
      subject.password = '1111'
      subject.password_confirmation = '1111'
      subject.valid?
      expect(subject.errors).not_to be_empty
    end

    describe '.authenticate_with_credentials' do
      it 'returns user if succesfully authenticated' do
        subject.save
        user = User.authenticate_with_credentials('jpeppermint@fictionalmail.com', 'Mmmmm')
        expect(subject).to be == user
      end

      it 'returns nil if not successfully authenticated' do
        subject.save
        user = User.authenticate_with_credentials('jpeppermint@fictionalmail.com', '999')
        expect(user).to be == nil
      end

      it 'authenticates and users if user type white space before / after email' do
        subject.save
        user = User.authenticate_with_credentials(' jpeppermint@fictionalmail.com', 'Mmmmm')
        expect(subject).to be == user
      end

      it 'authenticates and users if users type lower and upper case in email' do
        subject.save
        user = User.authenticate_with_credentials('jpeppermint@fictionalmail.com', 'Mmmmm')
        expect(subject).to be == user
      end
    end
    
  end
end
