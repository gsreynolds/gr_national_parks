#
# Cookbook:: gr_national_parks
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

hab_sup 'default'

hab_package 'gsreynolds/np-mongodb'
hab_package 'gsreynolds/national-parks'

hab_service 'gsreynolds/np-mongodb'
hab_service 'gsreynolds/national-parks' do
  bind 'database:np-mongodb.default'
end
