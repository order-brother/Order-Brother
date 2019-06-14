module ApplicationHelper
  def delete_link_to(label, url)
    link_to label, url, method: 'delete, data: { confirm: "確認刪除？" }, class: "btn btn-danger"'
  end
end
