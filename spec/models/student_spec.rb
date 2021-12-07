require "rails_helper"

RSpec.describe Student, type: :model do
  describe "Direct Associations" do
    it { should have_many(:attendee_ids) }

    it { should have_many(:written_reviews) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
    it { should have_many(:events_attending) }
  end

  describe "Validations" do
  end
end
