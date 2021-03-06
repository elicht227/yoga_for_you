require "rails_helper"

RSpec.describe StudentResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "students",
          attributes: {},
        },
      }
    end

    let(:instance) do
      StudentResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Student.count }.by(1)
    end
  end

  describe "updating" do
    let!(:student) { create(:student) }

    let(:payload) do
      {
        data: {
          id: student.id.to_s,
          type: "students",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      StudentResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { student.reload.updated_at }
      # .and change { student.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:student) { create(:student) }

    let(:instance) do
      StudentResource.find(id: student.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Student.count }.by(-1)
    end
  end
end
