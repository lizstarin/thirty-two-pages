class Dummy < ActiveRecord::Base
  attr_accessible :project_id, :page_count, :self_ends,
                  :trim_width, :trim_height

  belongs_to :project

  # def make_template
  #   w = self.trim_width
  #   h = self.trim_height
  #
  #   temp = "<div id='dummy'>"
  #   temp += "<div class='dummy-page first-page' width='#{w}' height='#{h}'>"
  #   temp += "</div>"
  #
  #   num = ("#{self.page_count}".to_i - 2)/2
  #
  #   num.times do |i|
  #     temp += "<div class='dummy-spread'>"
  #     2.times { temp += "<span class='dummy-page'></span>" }
  #     temp += "</div>"
  #   end
  #
  #   temp +="<div class='dummy-page last-page' width='#{w}' height='#{h}'>"
  #   temp += "</div>"
  #   temp += "</div>"
  #   temp
  # end
end