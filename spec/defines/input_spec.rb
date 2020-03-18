# frozen_string_literal: true

require 'spec_helper'

describe 'filebeat::input' do
  let(:title) { 'foo' }
  let(:pre_condition) do
    "class { '::filebeat':
      brokers => ['broker1.example.com'],
    }"
  end
  let(:params) do
    {
      topic: 'app-log',
      paths: '/var/log/app/app*.log',
    }
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it {
        is_expected.to contain_file('filebeat input foo')
          .with_path('/etc/filebeat/configs/foo.yml')
          .with_content(%r{^  paths: \["/var/log/app/app\*.log"\]})
      }
    end
  end
end
