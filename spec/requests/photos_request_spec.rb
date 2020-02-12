require 'rails_helper'

RSpec.describe "Photos", type: :request do
  include Rack::Test::Methods

  attr_reader :album, :photo, :user

  before(:each) do
    @user = User.create(email: 'test@gmail.com', password:'123456')
    sign_in user
    @album = Album.create(name: 'Amsterdam')
    @photo = Photo.create(album: album,
                          location: 'Amsterdam',
                          cam_type: 'Canon 6D',
                          exposure: '1/250',
                          iso_speed: '4000',
                          foc_length: '5' )
  end

  describe 'GET photos/:id' do
    it 'shows a photo' do
      get "/photos/#{photo.id}"
      expect(last_response.status).to eq(200)
    end
  end

  describe 'DESTROY photos/:id' do
    it 'Should delete photo' do
      expect do
        delete "/photos/#{photo.id}"
      end.to change(Photo, :count).by(-1)
    end
  end

  describe 'UPDATE photos/:id' do
    it 'Should update a photo' do
      patch "/photos/#{photo.id}",  photo: { id: photo.id, cam_type: 'Nikon' }
      expect(photo.reload.cam_type).to eq('Nikon')
    end
  end
end
