require 'spec_helper'

describe Submission do
  # Validation
  describe "validation" do
    it { should validate_presence_of(:restaurant_name) }
    it { should validate_presence_of(:restaurant_address) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
  end
end