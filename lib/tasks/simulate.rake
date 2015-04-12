require 'simplify'

namespace :simulate do

	desc 'TODO'
  task :payment do
		Simplify::public_key = "sbpb_N2YyMWMwNmMtNGRiOS00MjBhLTk1NzAtNTQ4NGEzZGUwNDUy"
		Simplify::private_key = "ERInD4vAyClXX8LVfMVRBqAKpj5teXHGsfWzcNRT0b15YFFQL0ODSXAOkNtXTToq"

		new_payment(rand())
  end

  task :populate do
  	cards = ["5105105105105100", "5555555555554444", "5185540810000019", "4012888888881881", "371449635398431"]

  	amount = rand()%


  end




  def new_payment card, amount 
		payment = Simplify::Payment.create({
        "card" => {
            "number" => card,
            "expMonth" => 11,
            "expYear" => 15,
            "cvc" => "123"
        },
        "amount" => amount,
        "currency"  => "BRL",
        "description" => "New payment to the merchant"
		})

		if payment['paymentStatus'] == 'APPROVED'
		    puts "Payment approved"
		end
  end

end