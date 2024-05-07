module ApplicationHelper
    def bootstrap_alert_class(type)
      case type.to_sym
      when :notice then 'success'
      when :alert, :error then 'danger'
      else 'info'
      end
    end
  end
  