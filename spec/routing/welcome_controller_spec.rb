require 'spec_helper'

describe WelcomeController do
  it { expect(get: '/').to route_to 'welcome#index' }
end