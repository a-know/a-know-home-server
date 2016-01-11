require 'rake'
require 'rspec/core/rake_task'

hosts = [
  {
    name:       'vm-web',
    short_name: 'vm:web',
    role:       'web_base',
  },
  {
    name:       'ci-web',
    short_name: 'ci:web',
    role:       'web_base',
  },
  {
    name:       'home.a-know.me',
    short_name: 'prod:web',
    role:       'web_prod',
  },
]

class ServerspecTask < RSpec::Core::RakeTask
  attr_accessor :target

  def spec_command
    cmd = super
    "env TARGET_HOST=#{target} #{cmd}"
  end
end

namespace :spec do
  desc "Run serverspec to all hosts"
  task :all => hosts.map {|h| 'spec:' + h[:short_name] }
  hosts.each do |host|
    desc "Run serverspec to #{host[:name]}"
    ServerspecTask.new(host[:short_name].to_sym) do |t|
      t.target = host[:name]
      t.pattern = "spec/roles/#{host[:role]}_spec.rb"
    end
  end
end

task :default => :spec

Dir['tasks/*.rake'].each do |f|
  load File.join(File.dirname(__FILE__), f)
end