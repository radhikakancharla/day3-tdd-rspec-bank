require 'account'
require 'transaction'
describe Account do 
    describe '#initialize' do
        it 'should create a new checking account with zero balance and no transactions' do
            a = Account.new(:checking)
            expect(a.type).to eql(:checking)
            expect(a.balance).to eql(0)
            expect(a.transactions).to eql([])
        end
    end
    describe '#deposit' do
        it 'should add $75 to a new savings account' do
             a = Account.new(:savings)
             a.deposit(75)
             expect(a.balance).to eql(75)
             expect(a.transactions.size).to eql(1)
             t = a.transactions.first
             expect(t.type).to eql(:deposit)
             expect(t.amount).to eql(75)
            
        end
    end
    
     describe '#filter_transactions' do
        it 'show all transactions' do
             a = Account.new(:savings)
             a.deposit(75)
             a.deposit(75)
             a.withdraw(25)
             trx = a.filter_transactions()
             expect(trx.size).to eql(3)
        end
        it 'show deposit transactions' do
             a = Account.new(:savings)
             a.deposit(75)
             a.deposit(75)
             a.withdraw(25)
             trx = a.filter_transactions(:deposit)
             expect(trx.size).to eql(2)
        end
    end
    
     describe '#withdrawls' do
        it 'should withdraw when funds are available' do
            a= Account.new(:checking)
            a.deposit(100)
            a.withdraw(25)
            expect(a.balance).to eql(75)
            expect(a.transactions.size).to eql(2)
            t = a.transactions.first
            expect(t.type).to eql(:deposit)
            expect(t.amount).to eql(100)
            t = a.transactions[1]
            expect(t.type).to eql(:withdrawl)
            expect(t.amount).to eql(25)
        end
         it 'should not withdraw when funds are not available' do
              a= Account.new(:checking)
              a.withdraw(25)
              expect(a.balance).to eql(-50)
              expect(a.transactions.size).to eql(1)
              t = a.transactions[0]
              expect(t.type).to eql(:fee)
              expect(t.amount).to eql(-50)
        end  
        
    end
    describe '#stats avg mean, median, standard deviation' do
        it 'should get avg mean' do
            a = Account.new(:savings)
            a.deposit(10)
            a.deposit(20) 
            a.deposit(10) 
            a.deposit(10)
            
            #stats = a.
            
            expect(a.stdmean).to eql(12)
            #p a.median
            expect(a.median).to eql(15)
        end
        
    end
end