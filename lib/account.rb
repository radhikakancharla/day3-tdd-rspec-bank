require 'transaction'
class Account
     attr_reader :type, :balance, :transactions
    def initialize(type)
        @type = type
        @balance = 0
        @transactions =[] 
    end
    
    def deposit (amount)
        @balance+= amount
        t= Transaction.new(:deposit,amount)
        @transactions << t
        #@transactions.push(new Transaction(:deposit,d))
    end
    def withdraw (amount)
        if @balance-amount >=0 
            @balance-= amount
            t= Transaction.new(:withdrawl,amount)
            @transactions << t
         else 
            @balance-=50
            t= Transaction.new(:fee,-50)
            @transactions << t
        end
    end
    def filter_transactions(type = nil)
        # if type == ''
        #     return @transactions
        # else
        #     trans = []
        #     i=0
        #     while i< @transactions.length do
        #         if @transactions[i].type == type
        #             trans.push(@transactions[i])
        #         end
        #         i+=1
        #     end
        #     return trans
        # end
        
        type ? @transactions.select { |t| t.type == type} : @transactions
        
    end
    def stdmean 
        i=@transactions.length
        return @balance/i
    end
    def median
        #@transactions.sort
        elements = @transactions.count
        center =  elements/2
        if elements % 2 == 0
            f = @transactions[center-1].amount + @transactions[center].amount
             return f /2
        else
             return @transactions[center].amount
        end
        
        # ascend = @transactions.sort
        # if ascend % 2 != 0
        #     (ascend.length + 1) / 2.0
        # else
        #     ((ascend.length/2.0) + ((ascend.length + 2)/2.0) / 2.0)
        # end
        
        #elements.even? ? (@transactions[center].amount + @transactions[center+1]).amount/2 : @transactions[center].amount  
    end
end