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

  def button_for(action, options = {})
    text = case action
      when :new      then 'Add'
      when :edit     then 'Save'
      when :register then 'Create'
      when :find     then 'Find'
    end
    cancel = content_tag :span, link_to('Cancel', '/')
    button = submit_tag text, options
    content_tag :div, cancel + button
  end

  # I don't use error_messages_for cos I don't like it's hard coded HTML and i
  # wanna change a couple things.
  def errors_for(objects, name = nil)
    objects = [ objects ].flatten
    name = objects.first.class.downcase.pluralize if name.nil?

    header = content_tag :h2, "The following prohibited this #{name} from being saved:"

    errors = objects.map{|o| o.errors.full_messages}.flatten.map{|e| content_tag :li, e }
    errors = content_tag :ul, errors
    errors.sub! /Watchable/, 'Record'

    content_tag(:div, content_tag(:div, header + errors, :class => 'error'), :class => 'flash')
  end
end
