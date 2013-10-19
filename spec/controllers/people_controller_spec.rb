require 'spec_helper'

describe PeopleController do
  describe 'GET index' do
    it 'renders the index template' do
      get :index

      expect(response).to render_template('index')
    end

    it 'exposes :people' do
      get :index

      expect(controller.people).to eq Person.all
    end
  end
end
