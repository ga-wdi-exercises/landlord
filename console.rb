require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging
require "faker"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

###MAIN INTERFACE - Commented out code is for new methods we design under models
def run_program()
    puts 'Welcome to your program Bob! Would you like access to apartments, tenants or both?(1/2/3) If you want to exit type \'exit\'!'
    answer = gets.chomp
    if answer == '1'
        puts 'Type \'a\' to view all of your properties!'
        answer = gets.chomp
        if answer == 'a'
            Apartment.get_all
            run_program
        else
            run_program
        end
    elsif answer == '2'
        puts 'Type \'p\' to view all of your tenants! Type q to find a specific tenant and address'
        answer = gets.chomp
        if answer == 'p'
            Tenant.get_all
            run_program
        elsif answer =='q'
            name = gets.chomp
            Tenant.find_apt(name)
            run_program
        else
            run_program
        end
    elsif answer == '3'
        puts 'Type \'b\' to view all of your tenants and their address!'
        answer = gets.chomp
        if answer == 'b'
            Apartment.get_all_ten
            run_program
        else
            run_program
        end
    elsif answer == 'exit'
        exit
    else
        run_program
    end
end
run_program
