require 'simplify'

namespace :simulate do

	desc 'TODO'
  task :payment do
		Simplify::public_key = "sbpb_N2YyMWMwNmMtNGRiOS00MjBhLTk1NzAtNTQ4NGEzZGUwNDUy"
		Simplify::private_key = "ERInD4vAyClXX8LVfMVRBqAKpj5teXHGsfWzcNRT0b15YFFQL0ODSXAOkNtXTToq"

		new_payment("5105105105105100", 2756)
  end

  task :populate do
		Simplify::public_key = "sbpb_N2YyMWMwNmMtNGRiOS00MjBhLTk1NzAtNTQ4NGEzZGUwNDUy"
		Simplify::private_key = "ERInD4vAyClXX8LVfMVRBqAKpj5teXHGsfWzcNRT0b15YFFQL0ODSXAOkNtXTToq"

  	cards = ["5105105105105100", "5555555555554444", "5185540810000019", "4012888888881881", "371449635398431"]

  	(1..200).each do |i|
  		card = cards[rand(4)]
  		amount = 5000 + rand(20000)
  		p card
  		p amount
  		new_payment( card, amount)
  	end
  	
  end


  def new_payment card, amount 
		payment = Simplify::Payment.create({
        "card" => {
            "number" => card,
            "expMonth" => 11,
            "expYear" => 15,
            "cvc" => "123"
        },
        "reference" => (Time.new(2015, 4, 10, 2, 2, 2, "+02:00").utc.to_i * 1000),
        "amount" => amount,
        "currency"  => "BRL",
        "description" => "New payment to the merchant"
		})

		if payment['paymentStatus'] == 'APPROVED'
		    puts "Payment approved"
		end
  end

end