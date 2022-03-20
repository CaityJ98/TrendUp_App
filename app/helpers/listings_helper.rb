#Formats the way the condition and price are presented. 
module ListingsHelper
    def format_condition(condition)
        arr = condition.split("_").map do |word|
            word.capitalize 

    end
    arr.join(" ")
end 

    def format_price(price)
        "$#{price/100.00}"

    end
end 
