require 'rails_helper'

RSpec.describe Teacher, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:teaching_events) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
