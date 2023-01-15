#Part A

#the inputs
annual_salary = float(input("Enter your annual salary: "))
portion_saved = float(input("Enter the percent of your salary to save, as a decimal: "))
total_cost = float(input("Enter the cost of your dream home"))

#the constants
current_savings = 0
portion_down_payment = 0.25
r=0.04

#the calculation
monthly_savings = (annual_salary / 12) * portion_saved #for knowing how much you saved in the month
down_payment = total_cost * portion_down_payment #for having the initial down payment

number_of_months = 0

#the while loop for extracting the number of months
while current_savings < down_payment:
    current_savings += monthly_savings + ((current_savings * r) / 12) # il prend le montant enregistré depuis la première #fois puis il ajoute the current saving*r/ 12 --> puis il ajoute 1 dans le nombre de de mois
    number_of_months += 1

print(f"Number of months: {number_of_months}")

