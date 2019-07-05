# frozen_string_literal: true
module ApplicationHelper

  def delete_link_to(label, url)
    link_to label, url, method: 'delete, data: { confirm: "確認刪除？" }, class: "btn btn-danger"'
  end

  def default_pick_up_time(current_time = Time.zone.now + 30.minutes)
    current_time ||= Time.zone.now + 30.minutes
    current_time.strftime('%Y-%m-%dT%H:%M')
  end

  def generate_pick_up_time(time, minutes)
    current_time ||= time + 30.minutes + minutes
    current_time.strftime("%Y-%m-%dT%H:%M")
  end

  def pick_up_time
    result = []
    10.times { |index| 
      result << generate_pick_up_time(Time.zone.now, 10.minutes * index)
    }
  #   2.times { |index|
  # result << generate_pick_up_time(Time.zone.now, 30.minutes * index)
  #   }
    result
  end
end