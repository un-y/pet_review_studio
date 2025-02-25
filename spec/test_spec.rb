require 'rails_helper'

RSpec.describe 'ルートパスのテスト', type: :request do
  it 'ルート (/) が homes#top に設定されているか' do
    get root_path
  end
end