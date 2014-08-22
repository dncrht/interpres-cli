# encoding: utf-8

=begin
  parser/jinja2.rb - parser for Jinja2 templates
  Based upon gettext-2.2.1/lib/gettext/tools/parser/glade.rb by Masao Mutoh

  Copyright (C) 2014 Daniel Cruz Horts

  You may redistribute under MIT license terms.
=end

module GetText
  module Jinja2Parser
    extend GetText
    extend self

    bindtextdomain('rgettext')

    def parse(file, targets = []) # :nodoc:
      lines = IO.readlines(file)
      parse_lines(file, lines, targets)
    end

    #from ary of lines.
    def parse_lines(file, lines, targets) # :nodoc:
      line_no = 0

      loop do
        line = lines.shift
        break unless line

        line_no += 1
        if matches = line.scan(/{% trans %}(.*?){% endtrans %}/)
          matches.each do |match|
            add_target(match.first, file, line_no, targets)
          end
        end
      end
      targets
    end

    def target?(file) # :nodoc:
      true
    end

    def add_target(val, file, line_no, targets) # :nodoc:
      return unless val.size > 0
      assoc_data = targets.assoc(val)
      val = CGI.unescapeHTML(val)
      if assoc_data
        targets[targets.index(assoc_data)] = assoc_data << "#{file}:#{line_no}"
      else
        targets << [val, "#{file}:#{line_no}"]
      end
      targets
    end
  end
end

if __FILE__ == $0
  # ex) ruby jinja2.rb file1.html file2.html
  ARGV.each do |file|
    p GetText::Jinja2Parser.parse(file)
  end
end
