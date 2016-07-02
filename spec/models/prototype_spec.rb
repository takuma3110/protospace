require 'rails_helper'

  describe Prototype do
    describe 'associations' do
      it 'is associated with user' do
        user = create(:user)
        prototype = create(:prototype, user: user)
        expect(prototype.user).to eq user
      end

    describe 'with likes' do
      let(:likes_num) { 1 }
      let!(:prototype) { create(:prototype, :with_likes, likes_num: likes_num) }
      it 'deletes the likes when Prototype is deleted' do
        expect{ prototype.destroy }.to change(Like, :count).by(-1 * likes_num)
      end
    end

    describe 'with comments' do
      let(:comments_count) { 1 }
      let!(:prototype) { create(:prototype, :with_comments, comments_count: comments_count) }
      it 'deletes the comments when prototype is deleted' do
        expect{ prototype.destroy }.to change(Comment, :count).by(-1 * comments_count)
      end
    end
  end

    describe 'validations' do
      describe "with valid attributes" do
        it "has valid factory" do
          expect(build(:prototype)).to be_valid
        end
      end
    end

    describe "without valid attributes" do
      it "is invalid without a title" do
        prototype = build(:prototype, title: nil)
        prototype.valid?
        expect(prototype.errors[:title]).to include("can't be blank")
      end

      it "is invalid without catch_copy" do
        prototype = build(:prototype, catch_copy: nil)
        prototype.valid?
        expect(prototype.errors[:catch_copy]).to include("can't be blank")
      end

      it "is invalid without a concept" do
        prototype = build(:prototype, concept: nil)
        prototype.valid?
        expect(prototype.errors[:concept]).to include("can't be blank")
      end
    end
  end
