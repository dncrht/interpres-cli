GetText::RGetText.add_parser GetText::Jinja2Parser

module Interpres
  class Extractor

    def initialize(inclusion, exclusion = nil)
      @inclusion = inclusion
      @exclusion = exclusion
    end

    def run
      GetText::RGetText.parse(file_list).map(&:msgid).sort
    end

    def file_list
      return base_file_list unless @exclusion

      base_file_list.reject { |filename| filename =~ @exclusion }
    end

    def base_file_list
      Dir.glob(@inclusion)
    end

  end
end
