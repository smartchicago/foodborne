require 'spec_helper'

describe Tweet do
  # Validation
  describe "validation" do
    it { should validate_uniqueness_of(:tweet_id) }
  end
end