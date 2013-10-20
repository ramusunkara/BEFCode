require 'spec_helper'

describe Settings do
  it 'has a host setting' do
    expect(Settings::CONFIG.host).to eq 'localhost'
  end

  it 'has a port setting' do
    expect(Settings::CONFIG.port).to eq 9887
  end

  it 'has a protocol setting' do
    expect(Settings::CONFIG.protocol).to eq 'http'
  end

  context 'when there are environment-specific credentials' do
    before do
      File.open(Rails.root.join('config', 'credentials-test.yml'), 'w') do |writer|
        writer.write(content)
      end
    end

    context 'and a setting references the environment' do
      context 'and that environment variable exists' do
      end

      context 'and that environment variable does not exist' do
      end
    end
  end

  context 'when there are no environment-specific credentials' do
  end
end
