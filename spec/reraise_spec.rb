
require_relative '../lib/reraise.rb'

describe ::ReRaise do
  
  it 'can catch an exception and re-raise it - for instance, after method_missing' do
    
    class ::ReRaise::MockMethodMissing
      
      def method_missing( method, *args )
        
        begin
          super
        rescue ::Exception => exception
          exception.reraise( 1 )
        end
        
      end
      
    end
    
    begin
      ::ReRaise::MockMethodMissing.new.some_method
    rescue ::Exception => reraised_exception
      reraised_exception.backtrace[ 0 ].should == __FILE__ + ":23:in `block (2 levels) in <top (required)>'"
    end
    
  end

  it 'can catch an exception and re-raise it - for instance, with a proxy' do
    
    class ::ReRaise::MockProxy
      
      def <=>( object )
        
        if some_other_object.respond_to?( :"<=>" )
          
          some_other_object <=> object
          
        else

          begin
            method_missing( __method__, object )
          rescue ::Exception => exception
            exception.reraise( 2 )
          end

        end
                
      end
      
    end
    
    begin
      ::ReRaise::MockProxy.new == 42
    rescue ::Exception => reraised_exception
      reraised_exception.backtrace[ 0 ].should == __FILE__ + ":55:in `block (2 levels) in <top (required)>'"
    end
    
  end
  
end