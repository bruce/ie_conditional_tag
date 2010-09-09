module BrowserBodyTag

  class Configuration

    def clear
      conditions.clear
    end
    
    def conditions
      @conditions ||= []
    end    
    
  end

end
