# frozen_string_literal: true

module A
  attr_accessor :abc
end

module B
  extend A
end

B.abc = 123
B.abc
