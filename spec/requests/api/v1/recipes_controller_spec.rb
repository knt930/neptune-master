require 'rails_helper'

RSpec.describe Api::V1::RecipesController, type: :request do

  describe '#index' do

    it '200が返ってくる' do
      get "/api/v1/recipes?first_launched_at=#{Time.now}"
      expect(response.status).to eq 200
    end

    before do
      FactoryBot.create(:recipe, boosted: false)
      FactoryBot.create(:recipe, boosted: true)
    end

    it 'レシピの一覧情報を取得できること(ブースト状態)' do
      get "/api/v1/recipes?first_launched_at=#{Time.now}"
      json = JSON.parse(response.body)
      expect(json["recipes"].first["boosted"]).to eq(true)
    end

    it 'レシピの一覧情報を取得できること(通常状態)' do
      get "/api/v1/recipes?first_launched_at=2018-11-10 00:00:00"
      json = JSON.parse(response.body)
      expect(json["recipes"].first["boosted"]).to eq(false)
    end
  end

  describe '#show' do

    let!(:recipe) { FactoryBot.create(:recipe) }
    let!(:ingredient) { FactoryBot.create(:ingredient, recipe_id: "#{recipe.id}") }
    let!(:instruction) { FactoryBot.create(:instruction, recipe_id: "#{recipe.id}") }


    it '200が返ってくる' do
      get "/api/v1/recipes/#{recipe.id}"
      expect(response.status).to eq 200
    end

    it 'レシピの詳細に紐づく材料を取得できること' do
      get "/api/v1/recipes/#{recipe.id}"
      json = JSON.parse(response.body)
      expect(json["recipe"]["ingredients"].first["recipe_id"]).to eq (recipe.id)
    end

    it 'レシピの詳細に紐づく手順を取得できること' do
      get "/api/v1/recipes/#{recipe.id}"
      json = JSON.parse(response.body)
      expect(json["recipe"]["instructions"].first["recipe_id"]).to eq (recipe.id)
    end
  end
end
