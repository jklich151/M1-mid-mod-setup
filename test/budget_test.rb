require 'minitest/autorun'
require 'minitest/pride'
require './lib/employee'
require './lib/department'
require './lib/budget'

class BudgetTest < Minitest::Test

  def test_it_exists
    budget = Budget.new("2019")

    assert_instance_of Budget, budget
  end

  def test_it_has_attributes
    budget = Budget.new("2019")

    assert_equal "2019", budget.year
  end

  def test_has_departments
    budget = Budget.new("2019")
    customer_service = Department.new("Customer Service")
    sales = Department.new("Sales")
    hr = Department.new("HR")

    budget.add_department(sales)

    assert_equal [sales], budget.departments

    budget.add_department(hr)

    assert_equal [sales, hr], budget.departments
  end

  def test_it_can_calculate_expenses
    budget = Budget.new("2019")
    customer_service = Department.new("Customer Service")
    sales = Department.new("Sales")
    hr = Department.new("HR")

    budget.add_department(customer_service)
    budget.add_department(sales)
    budget.add_department(hr)

    customer_service.expense(100)
    sales.expense(200)
    hr.expense(50)

    assert_equal 350, budget.total_expenses
  end

  def test_calculate_total_salary
    budget = Budget.new("2019")
    customer_service = Department.new("Customer Service")
    sales = Department.new("Sales")
    hr = Department.new("HR")
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})

    budget.add_department(customer_service)
    budget.add_department(sales)
    budget.add_department(hr)

    customer_service.hire(bobbi)
    sales.hire(aaron)

    assert_equal "190000", budget.total_salaries
  end
end
