require 'hashie'
require_relative 'objectize/version'

module Objectize
  module_function

  # Converts a hash or array of hashes into an object.
  #
  #   my_object = Objectize.to_object(a: { b: { c: 'foo' } })
  #   my_object.a.b.c #=> 'foo'
  def to_object(element)
    case element
    when Hash
      Hashie::Mash.new(element)
    when Array
      element.map { |sub_element| to_object(sub_element) }
    else
      element
    end
  end

  # Converts an objectized element back to a basic type (i.e. a hash or an
  # array of hashes)
  #
  #   my_hash = Objectize.to_basic_type(my_object)
  #   my_hash['a']['b']['c'] #=> 'foo'
  def to_basic_type(element)
    case element
    when Hashie::Mash
      element.to_hash
    when Array
      element.map { |sub_element| to_basic_type(sub_element) }
    else
      element
    end
  end
end
