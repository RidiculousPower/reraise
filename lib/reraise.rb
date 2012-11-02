
module ::ReRaise
  
  #############
  #  reraise  #
  #############
  
  ###
  #  Re-raise exception, adding a line to the Exception's backtrace 
  #    corresponding to line where missing call originated.
  #
  # @param depth_of_exception_from_originating_missing_call
  #
  #        [Integer]
  #
  def reraise( depth_of_exception_from_originating_missing_call )
    
    backtrace_array = backtrace
    missing_method_call = backtrace_array[ depth_of_exception_from_originating_missing_call ]
    backtrace_array.unshift( missing_method_call )

    raise exception
    
  end
  
end

class ::Exception
  include( ::ReRaise )
end
