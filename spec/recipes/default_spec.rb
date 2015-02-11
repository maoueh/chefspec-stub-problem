require 'spec_helper'

require_relative '../../libraries/stub_problem_library'

describe 'stub_problem::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      puts "Called in spec runner new: #{Chef::Recipe::StubProblem.query()}"
    end.converge(described_recipe)
  end

  before do
    allow(Chef::Recipe::StubProblem).to receive(:query).and_return("1.1")
    allow(::Chef::Recipe::StubProblem).to receive(:query).and_return("1.2")
    allow(::Chef::Recipe::StubProblem).to receive(:query).with(no_args).and_return("1.3")

    allow_any_instance_of(Chef::Recipe::StubProblem).to receive(:query).and_return("2.1")
    allow_any_instance_of(::Chef::Recipe::StubProblem).to receive(:query).and_return("2.2")
    allow_any_instance_of(::Chef::Recipe::StubProblem).to receive(:query).with(no_args).and_return("2.3")

    puts "Called in spec before: #{Chef::Recipe::StubProblem.query()}"
  end

  it 'includes default recipe' do  
    puts "Called in spec example: #{Chef::Recipe::StubProblem.query()}"

    expect(chef_run).to include_recipe('stub_problem::default')
  end
end
