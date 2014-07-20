module Smarping
  class Timestamp
    attr_reader :value
    
    def initialize(timestamp)
      regex_java = /^\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}\s[+-]\d{4}$/
      if regex_java.match(timestamp)
        @value = convert_from_java_format(timestamp)
      else
        @value = nil
      end
    end
    
    def convert_from_java_format(time_java)
      len_limit = 7
      time_array = time_java.split(/-|:|\s/, len_limit).map!.with_index do |x, i|
        if i != len_limit - 1
          x.to_i
        else
          x.insert(3, ':')
        end
      end
      Time.new(*time_array)
    end
    
    private :convert_from_java_format
  end
end