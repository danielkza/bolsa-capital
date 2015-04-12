require 'simplify'

class SimplifyHookController < ApplicationController

  def receive_event

		requestData = request.raw_post

		event = Simplify::Event.create({'payload' => requestData})

		puts "Event name #{event['name']}"

		data = event['data']

  end


end
