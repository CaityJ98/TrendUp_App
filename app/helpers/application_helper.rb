module ApplicationHelper
# styles alert notificiations and tells app what to return for each notice
    def select_alert_subclass(input)
        case input
        when 'notice'
            return 'success'
        when 'alert'
            return 'warning'
        when 'error'
            return 'danger'
        else return 'info'
           
       
    end 
end 
end
