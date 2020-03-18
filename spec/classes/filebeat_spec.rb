# frozen_string_literal: true

require 'spec_helper'

describe 'filebeat' do
  let(:params) do
    {
      brokers: ['broker1.example.com'],
    }
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it {
        is_expected.to contain_file('/etc/filebeat/filebeat.yml')
          .with_content(%r{^  hosts: \["broker1.example.com"\]})
      }
    end
  end
end
