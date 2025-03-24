import numpy as np
import random  
import statistics 

students = {}

num_students = int(input("Enter the number of students: "))

for _ in range(num_students):
    name = input("Enter student name: ")
    score = int(input(f"Enter {name}'s score: "))
    students[name] = score

print("\nStudent Scores:")
for name, score in students.items():
    print(f"{name}: {score}")

scores_array = np.array(list(students.values()))

average = np.mean(scores_array)
std_dev = np.std(scores_array) 
median = statistics.median(scores_array)  

print("\nStatistics:")
print(f"Average Score: {average:.2f}")
print(f"Standard Deviation: {std_dev:.2f}")
print(f"Median Score: {median:.2f}")

grade_messages = {
    "A": ["Excellent job!", "Clip that", "GGWP"],
    "B": ["Why got no A la -asian mom", "Keep it up!", "Nice effort!"],
    "C": ["Good attempt!", "You can improve!", "C for Chump"],
    "D": ["Needs improvement!", "dih </3", "You can do better!"],
    "F": ["Ts pmo br icl", "Git gud", "How do you fumble this bad bruh </3"]
}

def assign_grade(score):
    if score >= 90:
        return "A"
    elif score >= 80:
        return "B"
    elif score >= 70:
        return "C"
    elif score >= 60:
        return "D"
    else:
        return "F"

print("\nFinal Grades and Messages:")
for name, score in students.items():
    grade = assign_grade(score)
    message = random.choice(grade_messages[grade]) 
    print(f"{name}: {score} -> Grade {grade} | Message: {message}")
