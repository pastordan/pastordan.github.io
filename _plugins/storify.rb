class Storify < Liquid::Tag
  Syntax = /^\s*([^\s]+)(\s+(\d+)\s+(\d+)\s*)?/

  def initialize(tagName, markup, tokens)
    super

    if markup =~ Syntax then
      @id = $1

      if $2.nil? then
          @width = 560
          @height = 750
      else
          @width = $2.to_i
          @height = $3.to_i
      end
    else
      raise "No Storify ID provided in the \"Storify\" tag"
    end
  end

  def render(context)
    "<div class=\"storify\"><iframe class=\"hidden\" width=\"#{@width}\" height=\"#{@height}\" 
        allowfullscreen=\"1\"
        src=\"http://www.storify.com/#{@id}/embed?header=false&amp;border=false\">&nbsp;</iframe></div>"
  end

  Liquid::Template.register_tag "storify", self
end
