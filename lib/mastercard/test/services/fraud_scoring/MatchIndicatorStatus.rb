module Mastercard
  module Test
    module FraudScoring
      class MatchIndicatorStatus

        SINGLE_TRANSACTION_MATCH = '1'
        MULTIPLE_TRANS_IDENTICAL_CARD_MATCH = '2'
        MULTIPLE_TRANS_DIFFERING_CARDS_MATCH = '3'
        NO_MATCH_FOUND = '4'

      end
    end
  end
end