# encoding: utf-8

module Rubocop
  module Cop
    module Style
      # This cop looks for uses of block comments (=begin...=end).
      class BlockComments < Cop
        MSG = 'Do not use block comments.'

        def investigate(processed_source)
          processed_source.comments.each do |comment|
            if comment.text.start_with?('=begin')
              add_offence(:convention, comment.loc.expression, MSG)
            end
          end
        end
      end
    end
  end
end
