require 'spec_helper'

describe EventsController do
  it { expect(get: '/events').to route_to 'events#index' }
end
