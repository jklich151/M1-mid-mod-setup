require 'minitest/autorun'
require 'minitest/pride'
require './lib/employee'

class EmployeeTest < Minitest::Test

  def test_it_exists
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})

    assert_instance_of Employee, bobbi
  end

  def test_it_has_attributes
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})

    assert_equal "Bobbi Jaeger", bobbi.name
    assert_equal "30", bobbi.age
    assert_equal "100000", bobbi.salary
  end
end
