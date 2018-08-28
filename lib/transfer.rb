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
    if !(@sender.valid?)
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    
    if @status == "pending"
        @sender.deposit(-@amount)
        @receiver.deposit(@amount)
        @status = "complete"
    end

  end
    
end
