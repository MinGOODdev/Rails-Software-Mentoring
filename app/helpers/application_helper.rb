module ApplicationHelper

  def flash_msg(type)
      case type
        when 'success' then 'success'
        when 'warning' then 'warning'
        when 'danger' then 'danger'
        else 'info'
      end
  end

end
