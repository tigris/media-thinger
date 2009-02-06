# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def classes_for_controller_and_action
    [controller.controller_name, controller.action_name].join(' ')
  end

  def title_for_controller_and_action
    title = [ 'Media Thinger' ]
    title.push(controller.action_name.titleize) unless controller.action_name =~ /index/
    title.push(controller.controller_name.singularize.titleize).join(' &raquo; ')
  end
end
