require 'spec_helper'

describe WelcomeController do
  it { expect(get: '/').to route_to 'welcome#index' }
  it { expect(get: '/about').to route_to 'welcome#about' }
  it { expect(get: '/contact').to route_to 'welcome#contact' }
end