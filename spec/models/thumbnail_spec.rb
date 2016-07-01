require 'rails_helper'

describe Thumbnail do
  describe '#create' do
    describe "with valid attributes" do
      it "has a valid factory" do
        thumbnail = build(:thumbnail, :main)
        expect(thumbnail).to be_valid
      end
    end

    describe "without image attribute" do
      it "returns error" do
        thumbnail = build(:thumbnail, :main, image: nil)
        thumbnail.valid?
        expect(thumbnail.errors[:image]).to include("can't be blank")
      end
    end

    describe "without status attribute" do
      it "returns error" do
        thumbnail = build(:thumbnail, status: nil)
        thumbnail.valid?
        expect(thumbnail.errors[:status]).to include("can't be blank")
      end
    end

    it "has the wrong image format" do
      image = build(:thumbnail, :main, image: fixture_file_upload("img/sample.bmp", 'image/bmp'))
      image.valid?
      expect(image.errors[:image][0]).to include("You are not allowed to upload")
    end
  end

  describe 'association' do
    it 'is associated with a prototype' do
      prototype = create(:prototype)
      thumbnail = create(:thumbnail, :main, prototype: prototype)
      expect(thumbnail.prototype).to eq prototype
    end
  end
end
