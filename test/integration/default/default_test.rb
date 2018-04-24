# # encoding: utf-8

# Inspec test for recipe gr_national_parks::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

%w(np-mongodb national-parks).each do |pkg|
  describe command("hab sup status gsreynolds/#{pkg}") do
    its('exit_status') { should eq 0 }
  end
end

describe http('http://localhost:8080/national-parks/', enable_remote_worker: true) do
  its('status') { should cmp 200 }
  its('body') { should match 'U.S. National Parks v6.3' }
end
