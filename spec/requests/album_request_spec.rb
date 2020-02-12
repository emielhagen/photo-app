require 'rails_helper'

RSpec.describe "Albums", type: :request do
  include Rack::Test::Methods

  attr_reader :album, :user

  before(:each) do
    @album = Album.create(name: 'Amsterdam')
    @user = User.create(email: 'test@gmail.com', password: '123456')
    sign_in user
  end

  describe 'GET albums#index' do
    it 'should show all albums' do
      Album.create(name: 'London')
      get '/albums'
      expect(last_response.status).to eq(200)
      expect(last_response.body.include? 'London').to be(true)
      expect(last_response.body.include? 'Amsterdam').to be(true)
    end
  end

  describe 'GET albums/:id' do
    it 'shows an album' do
      get "/albums/#{album.id}"
      expect(last_response.status).to eq(200)
    end
  end

  describe 'DESTROY albums/:id' do
    it 'Should delete album' do
      expect do
        delete "/albums/#{album.id}"
      end.to change(Album, :count).by(-1)
    end
  end

  describe 'UPDATE albums/:id' do
    it 'Should update an album' do
      patch "/albums/#{album.id}",  album: { id: album.id, name: 'Paris' }
      expect(album.reload.name).to eq('Paris')
    end
  end
end
