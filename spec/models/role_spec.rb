require 'spec_helper'

describe Role do
  it { should belong_to(:person) }
  it { should belong_to(:tag) }
end