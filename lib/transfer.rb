class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    if @status == "pending"
      if !(@sender.valid?)
        @sender.deposit(-@amount)
        @receiver.deposit(@amount)
        @status = "complete"
      else
        return "Transaction rejected. Please check your account balance."
      end
    end
  end
    
end
