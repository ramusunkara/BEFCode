require 'spec_helper'

describe EventsController do
  describe 'GET index' do
    it 'renders the index template' do
      get :index

      expect(response).to render_template('index')
    end

    it 'exposes :events for published events' do
      Timecop.freeze do
        get :index

        expect(controller.events).to eq Event.published
      end
    end
  end
end
