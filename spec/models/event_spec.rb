require 'rails_helper'

RSpec.describe Event, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:teacher) }

    it { should have_many(:student_attendees) }

    it { should belong_to(:park) }

    it { should belong_to(:category) }

    end

    describe "InDirect Associations" do

    it { should have_many(:attending_students) }

    end

    describe "Validations" do

    end
end
