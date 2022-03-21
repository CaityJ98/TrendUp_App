#Formats the way the condition and price are presented. 
module ListingsHelper
    # Capitalise listing titles
    def format_condition(condition)
        arr = condition.split("_").map do |word|
            word.capitalize 

    end
    arr.join(" ")
end 
# set pricing in listing (cents)
    def format_price(price)
        "$#{price/100.00}"

    end
end 
