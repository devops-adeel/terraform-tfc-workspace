#!/usr/bin/env ruby
#
# -*- mode: ruby -*-
# vi: set ft=ruby :
#

content = inspec.profile.file('terraform.json')
params = JSON.parse(content)

token               = params['token']['value']
url                 = params['url']['value']
workspace           = params['workspace']['value']
team_id             = params['team_id']['value']

title "TFC Module Integration Test"

control "tfc-1.0" do
  impact 0.7
  title "Validate TFC workspace exists"
  desc "Validate TFC workspace exists"
  describe http("#{url}/api/v2/workspaces/#{workspace}",
              method: 'GET',
              headers: {
                'Authorization' => "Bearer #{token}",
                'Content-Type' => 'application/vnd.api+json',
              }) do
    its('status') { should eq 200 }
  end
end

control "tfc-2.0" do
  impact 0.7
  title "Validate TFC team exists"
  desc "Validate TFC team exists"
  describe http("#{url}/api/v2/teams/#{team_id}",
              method: 'GET',
              headers: {
                'Authorization' => "Bearer #{token}",
                'Content-Type' => 'application/vnd.api+json',
              }) do
    its('status') { should eq 200 }
  end
end

control "tfc-3.0" do
  impact 0.7
  title "Validate TFC workspace variables exist"
  desc "Validate TFC workspace variables exist"
  describe http("#{url}/api/v2/workspaces/#{workspace}/vars",
              method: 'GET',
              headers: {
                'Authorization' => "Bearer #{token}",
                'Content-Type' => 'application/vnd.api+json',
              }) do
    its('status') { should eq 200 }
  end
end
