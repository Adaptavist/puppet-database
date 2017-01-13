require 'spec_helper'

describe 'database', :type => 'class' do

  context "Should create mysql database by default" do
    let(:facts) { {
            :host => {
                'database::conf' =>
                    {
                         :db => {
                           :host =>     'localhost',
                           :collate =>  'utf8_bin',
                           :charset =>  'utf8',
                           :user =>     'user',
                           :password => 'pass',
                           :name =>     'db',
                        }
                    }
                },
            :osfamily => "RedHat",
            :operatingsystemrelease => '7'
        } }
    let(:params) { { :type => 'mysql' } }

    it do
      should contain_class('mysqlconfig')
      should contain_mysql__db("db").with(
           'host' =>     'localhost',
           'collate' =>  'utf8_bin',
           'charset' =>  'utf8',
           'user' =>     'user',
           'password' => 'pass',
           'name' =>     'db',
        )
    end

  end
end
