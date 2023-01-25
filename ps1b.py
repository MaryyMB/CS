# Part B

# the inputs
annual_salary = float(input("Enter your annual salary: "))
portion_saved = float(input("Enter the percent of your salary to save, as a decimal: "))
total_cost = float(input("Enter the cost of your dream home "))
semi_annual_raise = float(input("Enter the semi­annual raise, as a decimal "))

# the constants
current_savings = 0
portion_down_payment = 0.25  # required down payment percentage
r = 0.04  # investments

# the calculation
# for knowing how much you saved in the month
monthly_savings = (annual_salary / 12) * portion_saved
# for having the initial down payment
down_payment = total_cost * portion_down_payment

number_of_months = 0
#number_of_months = 

# the while loop for extracting the number of months
while current_savings < down_payment:
    if number_of_months % 6 == 0  and number_of_months != 0:
        annual_salary = annual_salary + annual_salary*semi_annual_raise
        monthly_savings = (annual_salary / 12) * portion_saved
        current_savings += monthly_savings + ((current_savings * r) / 12)
    else: 
        current_savings += monthly_savings + ((current_savings * r) / 12)
    
    number_of_months += 1

print(f"Number of months: {number_of_months}")
