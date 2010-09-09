module IEConditionalTag

  class Configuration
    include Enumerable

    def clear
      conditions.clear
    end
    
    def conditions
      @conditions ||= []
    end

    def each(&block)
      conditions.each(&block)
    end
    
  end

end
