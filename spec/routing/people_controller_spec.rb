require 'spec_helper'

describe PeopleController do
  it { expect(get: '/people').to route_to 'people#index' }
end